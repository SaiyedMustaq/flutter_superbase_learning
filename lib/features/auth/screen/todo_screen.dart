import 'package:flutter/material.dart';
import 'package:flutter_superbase_learning/superbase_database/note_database.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../di/locator.dart';
import '../../../routes/route_name.dart';
import '../../../services/superbase_services.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  final TextEditingController controller = TextEditingController();
  NoteDataBase noteDataBase = NoteDataBase();

  final authService = locator<SuperbaseServices>();

  List<Map<String, dynamic>> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //fetchTodos();
  }

  Future<void> fetchTodos() async {
    setState(() => isLoading = true);
    final user = supabase.auth.currentUser;
    final response = await supabase.from('todos').select().eq('id', user?.id ?? '').order('created_at', ascending: false);
    setState(() {
      todos = List<Map<String, dynamic>>.from(response);
      isLoading = false;
    });
  }

  Future<void> addTodo(String content) async {
    // final user = supabase.auth.currentUser;
    // if (content.isEmpty || user == null) {
    //   print("USER NOT FOUND $user");
    //   return;
    // }

    noteDataBase.createNoe(NoteModel(body: content));

    controller.clear();
    //fetchTodos();
  }

  Future<void> toggleTodo(String id, bool isDone) async {
    await supabase.from('notes').update({'is_done': !isDone}).eq('id', id);
    fetchTodos();
  }

  Future<void> deleteTodo(String id) async {
    await supabase.from('notes').delete().eq('id', id);
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📝 Todo List'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                String? error = await authService.logOut();
                if (error == null) {
                  Get.offNamed(RouteName.signIn);
                }
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a todo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => addTodo(controller.text),
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          isLoading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: todos.isEmpty
                      ? const Center(child: Text('No todos yet'))
                      : ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            final todo = todos[index];
                            return Dismissible(
                              key: Key(todo['id']),
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                child: const Icon(Icons.delete, color: Colors.white),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (_) => deleteTodo(todo['id']),
                              child: ListTile(
                                title: Text(
                                  todo['title'],
                                  style: TextStyle(
                                    decoration: todo['is_done'] ? TextDecoration.lineThrough : null,
                                  ),
                                ),
                                leading: Checkbox(
                                  value: todo['is_done'],
                                  onChanged: (_) => toggleTodo(todo['id'], todo['is_done']),
                                ),
                              ),
                            );
                          },
                        ),
                ),
        ],
      ),
    );
  }
}

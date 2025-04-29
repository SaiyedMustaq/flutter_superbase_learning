import 'package:flutter/material.dart';
import 'package:flutter_superbase_learning/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://avptgthrnwewirsqjiqs.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF2cHRndGhybndld2lyc3FqaXFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU3MTQyMTcsImV4cCI6MjA1MTI5MDIxN30.3UKOuhtFenfN5XGjnO73EBLo8wbvdIyMP_8COwfyc7w';
//'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsaG9laHV1bGVteHlmc2ZremlpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY0MjA2NzIsImV4cCI6MjA1MTk5NjY3Mn0.pA48_HdLqSRrXVAtDz1IGQ_NHrJnFJNp54oyJe6mc3c';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

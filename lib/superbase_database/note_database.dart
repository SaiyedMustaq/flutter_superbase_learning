import 'package:supabase_flutter/supabase_flutter.dart';

class NoteDataBase {
  final noteDatabase = Supabase.instance.client.from('notes');

  Future<void> createNoe(NoteModel note) async {

    await noteDatabase.insert(note.toMap());
  }

  final stream = Supabase.instance.client.from('notes').stream(primaryKey: ['id']).map(
    (maps) => maps.map((map) => NoteModel.fromMap(map)).toList(),
  );

  Future<void> updateNote(NoteModel oldNote, String newContent) async {
    await noteDatabase.update({'content': newContent}).eq('id', oldNote.id!);
  }

  Future<void> deleteNote(NoteModel note) async {
    await noteDatabase.delete().eq('id', note.id!);
  }
}

class NoteModel {
  int? id;
  String body;

  NoteModel({
    this.id,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': body,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      body: map['body'],
    );
  }
}

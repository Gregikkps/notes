import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/main.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  final String content;
  final String createdAt;

  Note({
    required this.content,
    required this.createdAt,
  });

  factory Note.fromMap(Map<String, dynamic> json) => Note(
        content: json['content'],
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'createdAt': createdAt,
    };
  }
}

class NotesService {
  Future<List<Note>> findAll() async {
    Database db = await DatabaseHelper.instance.database;
    var notes = await db.query('notes');
    List<Note> noteList =
        notes.isNotEmpty ? notes.map((c) => Note.fromMap(c)).toList() : [];

    print(noteList);
    return noteList;
  }

  Note create(String content) {
    return Note(
      content: content,
      createdAt: DateTime.now().toIso8601String(),
    );
  }
}

class NotesCubit extends Cubit<NotesService> {
  NotesCubit() : super(NotesService());
}

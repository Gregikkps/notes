import 'package:flutter/material.dart';
import 'package:notes_app/data/notes_cubit.dart';
import 'package:notes_app/main.dart';
import 'package:sqflite/sqflite.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key, required this.title});

  final String title;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              Future<List<Note>> getNotes() async {
                Database db = await DatabaseHelper.instance.database;
                var notes = await db.query('notes');
                List<Note> noteList = notes.isNotEmpty
                    ? notes.map((c) => Note.fromMap(c)).toList()
                    : [];

                print(noteList);
                return noteList;
              }

              getNotes();
            },
            child: const Text('Read'),
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              Future add(Note note) async {
                Database db = await DatabaseHelper.instance.database;

                return await db.insert('notes', note.toMap());
              }

              add(
                Note(
                  createdAt: DateTime.now().toIso8601String(),
                  content: noteController.text,
                  // id: '',
                ),
              );

              setState(() {});
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            controller: noteController,
            minLines: 3,
            maxLines: 100,
            decoration: const InputDecoration(
              labelText: 'Note ...',
            ),
          ),
        ],
      ),
    );
  }
}

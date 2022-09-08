import 'package:flutter/material.dart';
import 'package:notes_app/data/models/note.dart';
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
            child: const Text('Save'),
            onPressed: () {
              print(noteController.text);
              print(DateTime.now());

              Future<int> add(Grocery grocery) async {
                Database db = await DatabaseHelper.instance.database;
                return await db.insert('notes', grocery.toMap());
              }

              add(Grocery(
                  date: DateTime.now().toIso8601String(),
                  name: noteController.text));

              setState(() {});
            },
          )
        ],
      ),
      body: Center(
        child: TextFormField(
          controller: noteController,
          minLines: 3,
          maxLines: 10,
          decoration: const InputDecoration(
            labelText: 'Note ...',
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/data/notes_cubit.dart';
import 'package:notes_app/screens/add_note.dart';
import 'package:sqflite/sqflite.dart';

import '../main.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key, required this.title});

  final String title;

  @override
  State<NotesPage> createState() => _NotesPage();
}

class _NotesPage extends State<NotesPage> {
  // List<Note> vibeItems = [Note(note: "notatka", date: "21:30")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(
                title: 'Add note',
              ),
            ),
          );
        },
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: BlocBuilder<NotesCubit, NotesService>(
          builder: ((context, state) {
            return FutureBuilder<List<Note>>(
              future: state.findAll(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
                if (!snapshot.hasData) {
                  Future.delayed(const Duration(milliseconds: 5000), () async {
                    Future<List<Note>> getNotes() async {
                      Database db = await DatabaseHelper.instance.database;
                      var notes = await db.query('notes');
                      List<Note> noteList = notes.isNotEmpty
                          ? notes.map((c) => Note.fromMap(c)).toList()
                          : [];

                      print(noteList.first.content);
                      return noteList;
                    }

                    getNotes();
                  });
                  return const Center(
                    child: Text('Loading...'),
                  );
                }
                return snapshot.data!.isEmpty
                    ? const Center(child: Text('No notes in List.'))
                    : ListView(
                        children: snapshot.data!.map(
                          (note) {
                            return Center(
                              child: Card(
                                child: ListTile(
                                  title: Text(note.content),
                                  subtitle: Text(
                                    note.createdAt,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      );
              },
            );
          }),
        ),
      ),
    );
  }
}

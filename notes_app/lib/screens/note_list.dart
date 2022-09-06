import 'package:flutter/material.dart';
import 'package:notes_app/screens/add_note.dart';
import 'package:notes_app/utils/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key, required this.title});

  final String title;

  @override
  State<NotesPage> createState() => _NotesPage();
}

class _NotesPage extends State<NotesPage> {
  List<Note> vibeItems = [Note(note: "notatka", date: "21:30")];

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
        child: const Icon(Icons.note_add),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: vibeItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.list),
              trailing: Text(
                vibeItems[index].date,
              ),
              title: Text(
                vibeItems[index].note,
              ),
            );
          }),
      // body: ListView.builder(
      //   physics: const ScrollPhysics(),
      //   shrinkWrap: true,
      //   itemCount: vibeItems.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       color: Colors.white10,
      //       margin: const EdgeInsets.all(10),
      //       padding: const EdgeInsets.all(15),
      //       alignment: Alignment.center,
      //       child: Text(
      //         overflow: TextOverflow.visible,
      //         vibeItems[index],
      //         style: const TextStyle(
      //           color: Colors.white,
      //           fontSize: 22,
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

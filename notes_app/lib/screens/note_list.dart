import 'package:flutter/material.dart';
import 'package:notes_app/data/models/note.dart';
import 'package:notes_app/screens/add_note.dart';
import 'package:notes_app/utils/note.dart';

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
        child: const Icon(Icons.note_add),
      ),
      body: Center(
        child: FutureBuilder<List<Grocery>>(
            future: DatabaseHelper.instance.getGroceries(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Grocery>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? const Center(child: Text('No Groceries in List.'))
                  : ListView(
                      children: snapshot.data!.map((grocery) {
                        return Center(
                          child: Card(
                            // color: selectedId == grocery.id
                            //     ? Colors.white70
                            //     : Colors.white,
                            child: ListTile(
                              title: Text(grocery.name),
                              subtitle: Text(grocery.date),
                              onTap: () {
                                setState(() {
                                  // if (selectedId == null) {
                                  //   textController.text = grocery.name;
                                  //   selectedId = grocery.id;
                                  // } else {
                                  //   textController.text = '';
                                  //   selectedId = null;
                                  // }
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  // DatabaseHelper.instance.remove(grocery.id!);
                                });
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    );
            }),
      ),
      // body: ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: vibeItems.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       leading: const Icon(Icons.list),
      //       trailing: Text(
      //         vibeItems[index].date,
      //       ),
      //       title: Text(
      //         vibeItems[index].note,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

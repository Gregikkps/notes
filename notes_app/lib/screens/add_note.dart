import 'package:flutter/material.dart';

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
            child: Text('Save'),
            onPressed: () {},
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

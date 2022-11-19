import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoteModify extends StatelessWidget {
  final String noteID;
  bool get isEditing => noteID != null;

  NoteModify({required this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit note' : 'Create note')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Note title'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Note content'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: (() => {Navigator.of(context).pop()}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

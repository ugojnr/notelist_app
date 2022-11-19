import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  const NoteDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('warning'),
      content: Text('Are you sure you want to delete this note'),
      actions: [
        FloatingActionButton(
          child: Text('yes'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FloatingActionButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}

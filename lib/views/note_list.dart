import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notelist_app/models/note_for_listing.dart';
import 'package:notelist_app/services/notes_services.dart';
import 'package:notelist_app/views/note_delete.dart';

import 'note_modify.dart';

class NoteList extends StatefulWidget {
  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.instance<NotesService>();

  List<NoteForListing> notelist_app = [];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    notelist_app = service.getNotesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => NoteModify(
                    noteID: '',
                  )));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notelist_app[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context, builder: (_) => NoteDelete());
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: ListTile(
              title: Text(
                'hello',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                  'last edited on ${formatDateTime(notelist_app[index].lastEditDateTime)}'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NoteModify(
                          noteID: '',
                        )));
              },
            ),
          );
        },
        itemCount: notelist_app.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notelist_app/services/notes_services.dart';
import 'package:notelist_app/views/note_list.dart';

void setupLocator() {
  GetIt.instance.registerLazySingleton(() => NotesService());
}

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noteapp',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: NoteList(),
    );
  }
}

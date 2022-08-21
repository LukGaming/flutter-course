import 'package:flutter/material.dart';
import 'package:notes_app/services/crud/notes.services.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  late final NotesService _notesService;

  @override
  void initState() {
    _notesService = NotesService();
    _notesService.open();
    _notesService.createNote(text: "Teste");
    final notes = _notesService.getAllNotes();
    print(notes);
    super.initState();
  }

  @override
  void dispose() {
    _notesService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Notes"),
      ),
      body: FutureBuilder(
        future: _notesService.getAllNotes(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Text("Waiting for all notes...");
                    case ConnectionState.done:
                      return const Text("Already found the notes");
                    default:
                      return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

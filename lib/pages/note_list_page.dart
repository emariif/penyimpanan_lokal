import 'package:flutter/material.dart';
import 'package:penyimpanan_lokal/pages/note_add_update_page.dart';
import 'package:penyimpanan_lokal/provider/db_provider.dart';
import 'package:provider/provider.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          final notes = provider.notes;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Dismissible(
                key: Key(note.id.toString()),
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  color: Colors.red,
                  child: Row(
                    children: [
                      const Text(
                        'Delete Notes',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Container(
                        height: double.infinity,
                        width: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 36,
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  provider.deleteNote(note.id!);
                },
                child: Card(
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    onTap: () async {
                      final navigator = Navigator.of(context);

                      final selectedNote = await provider.getNoteById(note.id!);

                      navigator.push(
                        MaterialPageRoute(
                          builder: (context) {
                            return NoteAddUpdatePage(
                              note: selectedNote,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NoteAddUpdatePage(),
            ),
          );
        },
      ),
    );
  }
}

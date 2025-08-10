import 'package:challenge1/ProviderTask/Task3/add_note_page.dart';
import 'package:challenge1/ProviderTask/Task3/db_provider.dart';
import 'package:challenge1/ProviderTask/Task3/settings_page.dart';
import 'package:challenge1/notes/add_notes_data.dart';
import 'package:challenge1/notes/notes_db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class NotesHomePage extends StatefulWidget {
  const NotesHomePage({Key? key}) : super(key: key);

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NotesDBProvider>().getInitialNotes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          PopupMenuButton(  itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingsPage()),);
                },
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 11),
                    Text("Settings"),
                  ],
                ),
              ),
            ];
          },
          ),
        ],
      ),
      body: Consumer<NotesDBProvider>(
        builder: (context, provider, child) {
          final allNotes = provider.getNotes(); //similar as List<Map<String,dynamics>>allNotes=provider.getNotes();
          return allNotes.isEmpty
              ? const Center(
            child: Text('No Notes yet!'),
          )
              : ListView.builder(
            itemCount: allNotes.length,
            itemBuilder: (context, index) {
              final note = allNotes[index];
              return ListTile(
                leading: Text('${index + 1}'),
                title: Text(note['title']),
                subtitle: Text(note['desc']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNotesPage(
                              isUpdate: true,
                              id: note['s_no'].toString(),
                              title: note['title'],
                              description: note['desc'],
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        provider.deleteNote(note['s_no'].toString());
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNotesPage(isUpdate: false),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
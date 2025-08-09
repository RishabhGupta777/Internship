import 'package:challenge1/ProviderTask/Task3/add_note_page.dart';
import 'package:challenge1/ProviderTask/Task3/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'db_provider.dart';


class Task3HomePage extends StatefulWidget {
  const Task3HomePage({Key? key}) : super(key: key);

  @override
  State<Task3HomePage> createState() => _Task3HomePageState();
}

class _Task3HomePageState extends State<Task3HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DBProvider>().getInitialNotes();
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
      body: Consumer<DBProvider>(
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
                subtitle: Text(note['description']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNotePage(
                              isUpdate: true,
                              id: note['id'],
                              title: note['title'],
                              description: note['description'],
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        provider.deleteNote(note['id']);
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
              builder: (context) => const AddNotePage(isUpdate: false),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
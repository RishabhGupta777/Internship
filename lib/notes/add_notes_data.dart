import 'package:challenge1/notes/notes_db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddNotesPage extends StatefulWidget {
  final bool isUpdate;
  final String? id;
  final String? title;
  final String? description;

  const AddNotesPage({
    Key? key,
    required this.isUpdate,
    this.id,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  State<AddNotesPage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotesPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      titleController.text = widget.title ?? '';
      descController.text = widget.description ?? '';
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final provider = context.read<NotesDBProvider>();
    // final provider = Provider.of<DBProvider>(context, listen: false);
    final title = titleController.text.trim();
    final desc = descController.text.trim();

    if (title.isEmpty || desc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields')),
      );
      return;
    }

    if (widget.isUpdate) {
      provider.updateNote(widget.id!, title, desc);
    } else {
      provider.addNote(title, desc);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUpdate ? 'Update Note' : 'Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 5,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveNote,
                  child: Text(widget.isUpdate ? 'Update' : 'Add'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
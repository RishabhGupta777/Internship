import 'package:provider/provider.dart';
import 'list_map_provider.dart';
import 'package:flutter/material.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<ListMapProvider>().addData({
              "name": "Contact Name",
              "mobNo": "9283726375",
            });
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
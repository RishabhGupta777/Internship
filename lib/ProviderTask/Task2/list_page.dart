import 'package:challenge1/ProviderTask/Task2/add_data_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: Consumer<ListMapProvider>(
        builder: (context, provider, child) {
          final allData = provider.getData();
          if (allData.isEmpty) {
            return const Center(
              child: Text('No Contacts yet!!'),
            );
          }
          return ListView.builder(
            itemCount: allData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(allData[index]['name']),
                subtitle: Text(allData[index]['mobNo']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<ListMapProvider>().updateData({
                          "name": "Updated Contact",
                          "mobNo": "7711771177",
                        }, index);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<ListMapProvider>().deleteData(index);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
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
          // The screenshot shows navigation to the AddDataPage.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDataPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
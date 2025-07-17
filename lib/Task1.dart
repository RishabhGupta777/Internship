import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  final List<String> topics = [
    'Orientation',
    'Git Setup',
    'Android Studio',
    'Kotlin/Java Tools',
    'Flutter Basics',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding Checklist')),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: Icon(Icons.check_circle_outline,color: Colors.blue,),
              title: Text(topics[index]),
              subtitle: Text('Task ${index + 1} completed'),
            ),
          );
        },
      ),
    );
  }
}

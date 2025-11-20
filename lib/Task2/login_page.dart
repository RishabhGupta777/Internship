import 'package:challenge1/Task2/task2_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Detail'),centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _name, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _email, decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Task2Screen()),
              ),
              child: Text('Go to see the items'),
            )
          ],
        ),
      ),
    );
  }
}
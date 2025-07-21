import 'package:challenge1/Task2/task2_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),centerTitle: true,),
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _email, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _password, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Task2Screen()),
              ),
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
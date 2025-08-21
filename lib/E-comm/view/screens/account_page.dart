import 'package:challenge1/E-comm/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(
        onPressed: (){
          AuthController.instance.logout();
        },
          child: Text("Logout"))),
    );
  }
}

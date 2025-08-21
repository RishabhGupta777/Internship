import 'package:challenge1/E-comm/view/screens/account_page.dart';
import 'package:challenge1/E-comm/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';

import 'controller/auth_controller.dart';


// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [
  Text('Home'),
  Text('Categories'),
  AuthController.instance.isLoggedIn ? AccountPage() : LoginScreen(),
  Text('Chats'),
  Text('Profile')
];
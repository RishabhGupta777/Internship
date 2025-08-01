import 'package:challenge1/Clima/screens/loading_screen.dart';
import 'package:challenge1/FlashChat/components/checkuser.dart';
import 'package:challenge1/FlashChat/screens/chat_screen.dart';
import 'package:challenge1/FlashChat/screens/home_page.dart';
import 'package:challenge1/FlashChat/screens/login_screen.dart';
import 'package:challenge1/FlashChat/screens/registration_screen.dart';
import 'package:challenge1/FlashChat/screens/welcome_screen.dart';
import 'package:challenge1/Task1.dart';
import 'package:challenge1/Task2/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    home:LoadingScreen(),

      //   initialRoute: CheckUser.id,
      // routes: {     //map due to {}
      //   CheckUser.id: (context)=> CheckUser(),
      //   HomePage.id:(context)=>HomePage(),
      // WelcomeScreen.id: (context)=>WelcomeScreen(),
      //   LoginScreen.id: (context)=>LoginScreen(),
      //  RegistrationScreen.id:(context) =>RegistrationScreen(),
      // }


    );
  }
}


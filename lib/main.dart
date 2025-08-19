import 'package:challenge1/Assistant/chat_bot.dart';
import 'package:challenge1/E-comm/view/widgets/bottom_navigationScreen.dart';
import 'package:challenge1/ProviderTask/Task1/counter_provider.dart';
import 'package:challenge1/ProviderTask/Task2/list_map_provider.dart';
import 'package:challenge1/ProviderTask/Task3/db_provider.dart';
import 'package:challenge1/ProviderTask/Task3/theme_provider.dart';
import 'package:challenge1/Assistant/assistant_Screen.dart';
import 'package:challenge1/notes/db_helper.dart';
import 'package:challenge1/notes/notes_db_provider.dart';
import 'package:challenge1/notes/notes_homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import 'E-comm/controller/auth_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value){   // Initialize Firebase
    Get.put(AuthController());
  });
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => DBProvider()),
        ChangeNotifierProvider(create: (context) => NotesDBProvider(dbHelper: DBHelper.getInstance)),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(), // Use 'const' with the constructor to improve performance.
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeProvider>().getThemeValue() ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    home:BottomNavigationScreen(),

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


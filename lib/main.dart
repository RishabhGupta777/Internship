import 'package:challenge1/E-comm/view/screens/auth/sign_up_screen.dart';
import 'package:challenge1/E-comm/view/widgets/bottom_navigationScreen.dart';
import 'package:challenge1/ProviderTask/Task1/counter_provider.dart';
import 'package:challenge1/ProviderTask/Task2/list_map_provider.dart';
import 'package:challenge1/ProviderTask/Task3/db_provider.dart';
import 'package:challenge1/ProviderTask/Task3/theme_provider.dart';
import 'package:challenge1/notes/db_helper.dart';
import 'package:challenge1/notes/notes_db_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'E-comm/controller/auth_controller.dart';
import 'E-comm/controller/internet_controller.dart';
import 'E-comm/controller/internet_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value){   // Initialize Firebase
    Get.put(AuthController());
    Get.put(InternetController());
  });
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => DBProvider()),
        ChangeNotifierProvider(create: (context) => NotesDBProvider(dbHelper: DBHelper.getInstance)),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => InternetProvider()),
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
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeProvider>().getThemeValue() ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    home:BottomNavigationScreen(),

    );
  }
}


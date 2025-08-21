import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/auth_controller.dart';
import '../screens/account_page.dart';
import '../screens/auth/login_screen.dart';
class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBarTheme(
        data: BottomNavigationBarThemeData(
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              pageIdx = index;
            });
          },
          currentIndex: pageIdx,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 25),
                label: 'Home'

            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined, size: 25),
                label: 'Categories'

            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 25),
                label: 'Account'

            ),

            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.whatsapp, size: 25),
                label: 'Chats'

            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.edit_note, size: 25),
                label: 'Personalisation'

            ),
          ],
        ),
      ),
      body:Center(
        child: Obx(() {  //taki lagout karne ke baad account page me change hoker
      final pages = [
        const Text('Home'),
        const Text('Categories'),
        AuthController.instance.isLoggedIn ? const AccountPage() : LoginScreen(),
        const Text('Chats'),
        const Text('Profile'),
      ];
      return pages[pageIdx];
        }),
    ),

    );
  }
}
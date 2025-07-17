import 'package:challenge1/FlashChat/components/nar_bar.dart';
import 'package:challenge1/FlashChat/components/search_user.dart';
import 'package:challenge1/FlashChat/constants.dart';
import 'package:challenge1/FlashChat/screens/chat_screen.dart';
import 'package:challenge1/FlashChat/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
// User? loggedInUser; //loggedInUser is declared as late Firebase, but Firebase
// is not the correct type. It should be User? because FirebaseAuth.currentUser returns a User? object.

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textEditingController = TextEditingController();
  final _auth = FirebaseAuth.instance; //_auth is object and FirebaseAuth isa class
  String? messageText;
  String name='' ;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        setState(() {
          //Use setState() when updating loggedInUser to ensure UI updates.
          loggedInUser = user;
        });
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchUser()),
            );
          }),
        ],
        title: Text('⚡️ Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
            MessageStream(),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('UserId').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final registerIds = (snapshot.data! as QuerySnapshot).docs;
          List<UserBubble> userBubbles =
              []; //pahle Text widget ka list tha but ab MessageBubble naam ke stateless widget ka list
          for (var registerId in registerIds) {
            final registerEmail = registerId['register'];

            final currentUser = loggedInUser?.email;

            if (registerEmail != currentUser){   //taki user ki khud ki id userlist me na jae
              final userBubble = UserBubble(
                registeredEmail: registerEmail,
              );

            userBubbles.add(userBubble);
          }
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: userBubbles,
            ),
          );
        });
  }
}

class UserBubble extends StatelessWidget {
  //Now messageBubble is A Widget

  UserBubble({required this.registeredEmail});
  final String registeredEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // har build ke par padding laga diya h
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(Receiver: registeredEmail),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical:
                    5),
                child: Padding(
                  padding:EdgeInsets.all(20.0),  //more padding due to material around our text is too close to our text;
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Text(
                        registeredEmail,
                        style: TextStyle(color: Colors.black54, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
    ;
  }
}

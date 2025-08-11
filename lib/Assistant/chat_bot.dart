import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // for jsonEncode


class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController searchController=TextEditingController();
  String _result=" ";
  bool isLoading = false; // for progress indicator
  List<Map<String, dynamic>> chatList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text('AI Assistant'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body:ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: (){
                            print("clicked");
                            if(searchController.text.isNotEmpty){
                              getResponse();
                            }
                          },
                          icon: Icon(Icons.send, color: Colors.blue)),
                      hintText: 'Ask me anything...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF0F0F0),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: AnimatedTextKit(
                      key: ValueKey(_result), // <-- Forces rebuild when _result changes
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(_result),

                      ], ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  void getResponse()async{
    String apiKey="AIzaSyCMMw0ElJwUy3BwQWri06bm52CrJCy-cXY";
    String Url="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey";

    setState(() {
      isLoading = true; // show loader
    });

    chatList.add({
      "role": "user",
      "parts": [
        {
          "text": searchController.text,
        }
      ]
    });

    Map<String, dynamic> bodyParams = {
      "contents": chatList,
    };

    var responce=await http.post(Uri.parse(Url),body:jsonEncode(bodyParams));
    if(responce.statusCode==200){
      print(responce.body);
      var data=jsonDecode(responce.body);
      setState(() {
       _result= data['candidates'][0]["content"]["parts"][0]["text"];
      });

      // Add AI response
      chatList.add({
        "role": "model",
        "parts": [
          {
            "text": _result,
          }
        ]
      });

    }else{
      print(responce.statusCode);
    }

    setState(() {
      isLoading = false; // show loade
    });

  }
}

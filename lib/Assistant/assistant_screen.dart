import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // for jsonEncode


class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
 final TextEditingController searchController=TextEditingController();
 String result=" ";
 bool isLoading = false; // for progress indicator
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
                animatedTexts: [
                  TyperAnimatedText(result),

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
    String apiKey="";
    String Url="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey";

    setState(() {
      isLoading = true; // show loader
    });

  Map<String,dynamic> bodyParams ={
    "contents": [
      {
        "parts": [
          {
            "text":searchController.text,
          }
        ]
      }
    ]
  };


 var responce=await http.post(Uri.parse(Url),body:jsonEncode(bodyParams));
 if(responce.statusCode==200){
   print(responce.body);
   var data=jsonDecode(responce.body);
   setState(() {
     result = data['candidates'][0]["content"]["parts"][0]["text"];
   });


 }else{
   print(responce.statusCode);
 }

    setState(() {
      isLoading = false; // show loade
    });

  }
}

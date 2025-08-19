import 'dart:math';

import 'package:flutter/material.dart';

class Magic8ball extends StatefulWidget {
  const Magic8ball({super.key});

  @override
  State<Magic8ball> createState() => _Magic8ballState();
}

class _Magic8ballState extends State<Magic8ball> {
  int count=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("magic8ball"),
      ),
     body:
        ElevatedButton(
            onPressed: (){
              setState(() {
                count=Random().nextInt(5)+1;//bich me 5 likhe h means the randomice bw 0 and 4 so add +1;
              });
            },
            child: Image.asset('assets/images/ball$count.png'))
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
   void PlaySound(int NoteNumber){
     final player = AudioPlayer();
     player.play(AssetSource('tunes/note$NoteNumber.mp3'));
   }

   Expanded buildKey({required int SoundNumber,required Color color}){
    return Expanded(
       child: ElevatedButton(
         onPressed: (){
           PlaySound(SoundNumber);
         },
         child:Container(color:color,),
       ),
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // scaffold ke ander background colour ko black karne ke liye
      appBar: AppBar(
        title: Text('Xylophone'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(SoundNumber:1,color:Colors.red),
          buildKey(SoundNumber: 2, color: Colors.orange),
          buildKey(SoundNumber: 3, color: Colors.yellow),
          buildKey(SoundNumber: 4, color: Colors.green),
          buildKey(SoundNumber: 5, color: Colors.teal),
          buildKey(SoundNumber: 6, color: Colors.blue),
          buildKey(SoundNumber: 7, color: Colors.purple),


        ],
      ),
    );
  }
}

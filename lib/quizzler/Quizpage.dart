import 'package:challenge1/quizzler/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Icon> scorekeeper = [
  ];

  QuizBrain quizBrain=QuizBrain();    //small q se quizBrain name ka object banaye of the class big Q QuizBrain

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer= quizBrain.getQuestionAnswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "rFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scorekeeper = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title:Text("QuizPage")
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:EdgeInsets.all(8.0),
            child: Container(height:400,
              child: Center(child: Text(quizBrain.getQuestionText(), //at index questionNumber
                  style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),)),
            ),
          ),


          Expanded(
              child:ElevatedButton(onPressed:(){
                checkAnswer(true);

              },
                  child:Container(
                    color: Colors.green,
                  child:Text("True",
                  style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),
                  )))
          ),


          Expanded(
              child:ElevatedButton(onPressed:(){
                checkAnswer(false);
              },
                  child:Container(
                      color: Colors.red,
                      child:Text("False",
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),
                      )))
          ),

          Row(
            children:scorekeeper,
          )

        ],
      ),
    );
  }
}




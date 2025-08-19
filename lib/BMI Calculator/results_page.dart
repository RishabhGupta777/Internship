import 'package:challenge1/BMI%20Calculator/constants.dart';
import 'package:challenge1/BMI%20Calculator/input_page.dart';
import 'package:challenge1/BMI%20Calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
 ResultsPage({required this.interpretaion,required this.bmiResult,required this.resultText});

 final String interpretaion;
 final String bmiResult;
 final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
         title: Text('BMI CALCULATOR'),
       centerTitle: true,
     ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text('YourResult',style: kTitleTextStyle,),
              )
          ),
          
          Expanded(
              flex: 5,
              child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:[
                        Text(resultText.toUpperCase(),textAlign:TextAlign.center,style: kResultsTextStyle,),
                        Text(bmiResult,textAlign:TextAlign.center,style: kBMITextStyle ),
                        Text(interpretaion,textAlign:TextAlign.center,style: kBodyTextStyle ),

                      ]
                  )
              )),
          BottomButton(onTap:(){ Navigator.pop(context);},
            buttonTittle:'RE-CALCULATE',
          )
          
        ],
        
      )
    );
  }
}

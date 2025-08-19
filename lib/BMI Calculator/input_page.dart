import 'package:challenge1/BMI%20Calculator/Calculator_brain.dart';
import 'package:challenge1/BMI%20Calculator/constants.dart';
import 'package:challenge1/BMI%20Calculator/icon_content.dart';
import 'package:challenge1/BMI%20Calculator/results_page.dart';
import 'package:challenge1/BMI%20Calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender ? selectedGender;   // selectedGender as nullable using ?
  int height = 180;
  int weight=60;
  int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender= Gender.male ;
                      });
                    },
                                  colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour ,
                                  cardChild: iconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',
                                  ),

                                )),
              Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                                  colour:selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour ,
                                  cardChild:
                    iconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                                )),
            ],
          )),
          Expanded(
              child: ReusableCard(
                  colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: kNumberTextStyle,),
                      Text('cm',style: kNumberTextStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555) ,
                      overlayColor:Color(0x29EB1555) ,
                  thumbShape:RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value:height.toDouble() ,
                        min: 120,
                        max: 220,
                        onChanged:(double newValue){
                          setState(() {
                            height=newValue.round();  //.round for double-->int
                          });
                        }
                    ),
                  )
                ],
              ),
              )),
          Expanded(
            child: Row(children: [
              Expanded(child: ReusableCard(
                  colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('WEIGHT',style: kLabelTextStyle,),
                  Text(weight.toString(),style: kNumberTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                        setState(() {
                          weight--;
                        });
                      }),
                                       SizedBox(width: 10,),
                      RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                        setState(() {
                          weight++;
                        });
                      }),
                    ],
                  ),

                ],
              ),
              )),
              Expanded(child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE',style: kLabelTextStyle,),
                    Text(age.toString(),style: kNumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                          setState(() {
                            age--;
                          });
                        }),
                        SizedBox(width: 10,),
                        RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                          setState(() {
                            age++;
                          });
                        }),
                      ],
                    ),

                  ],
                ),
              )),

            ],
            ),),

          BottomButton(onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);//yha se information jaega calaculator brain me
    Navigator.push(context, MaterialPageRoute(builder:(context)=>ResultsPage(
      interpretaion: calc.getInterpretation(),
      resultText: calc.getResult(),             //yha se hum cal object ko bhejenge resultsPage me
      bmiResult: calc.calculateBMI(),
    )));
    },
          buttonTittle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
 BottomButton({required this.onTap,required this.buttonTittle });
  final VoidCallback onTap;
  final String buttonTittle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTittle,style: kLargeButtonTextStyle,)),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        // padding: EdgeInsets.only(bottom: 20),
        height: kBottomContainerHeight,

      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({required this.icon,required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        child: Icon(icon),
        elevation: 0.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape:CircleBorder(),
       fillColor: Color(0xFF4C4E5E),



    );

  }
}

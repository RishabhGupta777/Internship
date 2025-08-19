import 'package:challenge1/destini/story_brain.dart';
import 'package:flutter/material.dart';

class Destini extends StatefulWidget {
  const Destini({super.key});

  @override
  State<Destini> createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {

  //TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.
  StoryBrain storyBrain=StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        //TODO: Step 1 - Add background.png to this Container as a background image.
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
    ),
    ),



    padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
    constraints: BoxConstraints.expand(),  //BoxConstraints.expand() is used to create constraints that force a widget to expand to fill all available
          // space in its parent. This is particularly useful when you want a widget to take up the maximum area allowed, regardless of its intrinsic size.
    child: SafeArea(
      child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
      Padding(
      padding:EdgeInsets.all(8.0),
      child: Container(height:400,
        child: Center(child: Text(storyBrain.getStory(), //at index questionNumber
          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),)),
      ),
    ),


            Expanded(
                flex: 2,
                child:ElevatedButton(onPressed:(){
                  setState(() {
                    storyBrain.nextStory(1);
                  });
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),

                    child:Container(
                        //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                        child:Text(storyBrain.getChoice1(),
                          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),
                        )))
            ),
            SizedBox(
              height: 20.0,
            ),

            //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
            //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
            Expanded(
                flex: 2,
                child:Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: ElevatedButton(
                      onPressed:(){
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child:Container(
                          //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                          child:Text(storyBrain.getChoice2(),
                            style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),
                          ))),
                )
            ),
      ]
    ),

        )
    )
    );

  }
}

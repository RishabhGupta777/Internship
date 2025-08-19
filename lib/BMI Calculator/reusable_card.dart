import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {


  ReusableCard({required this.colour,required this.cardChild,this.onPress});//on Press ko nullable bana diye inche ? laga ke
  final Color colour;
  final Widget cardChild;
  final VoidCallback ? onPress;  // yha Function ke jagah voidCallback rakho
    //due to  The onTap property of GestureDetector expects a function of type VoidCallback,
  // which is essentially a function with no parameters and no return value (void Function()).

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

//onTap: (){
//                       setState(() {
//                         selectedGender = Gender.male;
//                       });
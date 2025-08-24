
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'rounded_contaianer.dart';


class TButton extends StatelessWidget {
  final double ? width;
  final double ? height;
  final Color backgroundColor;
  final String ? text;
  final VoidCallback onTap;
  final double radius;
  final Color textColor ;
  final FontWeight fontWeight;

  const TButton({
    super.key,
    this.width ,
    this.height ,
    this.backgroundColor = primary,
    this.textColor = Colors.white,
    required this.text ,
    required this.onTap,
    this.radius = 12,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TRoundedContainer(
        backgroundColor: backgroundColor,
        width: width,
        height: height,
        radius: radius,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(color:textColor,fontWeight: FontWeight.w600,fontSize:18),
          ),
        ),
      ),
    );
  }
}
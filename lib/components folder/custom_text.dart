import 'package:flutter/material.dart';


Widget CustomText({
  required String text,
  required Color,
    FontWeight fw = FontWeight.w500,

  required double fontSize,
  TextDecoration? decoration,
  Color? decorationColor,
  List<Shadow>? shadows,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize ,
            fontWeight: fw,

      color: Color ?? Colors.black,
      decoration: decoration,
      decorationColor: decorationColor,
      shadows: shadows,
    ),
  );
}

import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary =  Colors.indigo;
  static const Color darkGrey = Color(0xff525252);
  static const Color grey = Color(0xff737477);
  static const Color lightGrey = Color(0xff9E9E9E);

  // new colors
  static const Color darkPrimary = Color(0xFF3949AB);
  static const Color lightPrimary = Colors.indigoAccent; // color with 80% opacity
  static const Color grey1 = Color(0xff707070);
  static const Color grey2 = Color(0xff797979);
  static const Color grey3 =  Colors.black12;

  static const Color purple = Color(0xFF7E57C2);

  static const Color black = Colors.black;
  static const Color orange = Colors.orange;

  static const Color white = Colors.white;
  static const Color offWhite = Colors.white70;

  static const Color green = Color(0xff06d089); // red color

  static const Color error = Color(0xffe61f34); // red color


  static MaterialStateProperty<Color> materialColor(var color) {
    return MaterialStateProperty.all<Color>(color);
  }

  static MaterialStateProperty<OutlinedBorder> materialShape(var shape) {
    return MaterialStateProperty.all<OutlinedBorder>(shape);
  }
}

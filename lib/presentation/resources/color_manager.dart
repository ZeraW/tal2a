import 'package:flutter/material.dart';

class ColorManager {
  static Color primary =  Colors.indigo;
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color lightGrey = const Color(0xff9E9E9E);

  // new colors
  static Color darkPrimary = const Color(0xFF3949AB);
  static Color lightPrimary = const Color(0xFF5C6BC0); // color with 80% opacity
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color grey3 =  Colors.black12;

  static Color white = Colors.white;
  static Color offWhite = Colors.white70;

  static Color green = const Color(0xff06d089); // red color

  static Color error = const Color(0xffe61f34); // red color


  static MaterialStateProperty<Color> materialColor(var color) {
    return MaterialStateProperty.all<Color>(color);
  }

  static MaterialStateProperty<OutlinedBorder> materialShape(var shape) {
    return MaterialStateProperty.all<OutlinedBorder>(shape);
  }
}

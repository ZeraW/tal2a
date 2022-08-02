import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

ButtonStyle correctStyle() {
  return ButtonStyle(
      backgroundColor: ColorManager.materialColor(ColorManager.green));
}

ButtonStyle wrongStyle() {
  return ButtonStyle(
      backgroundColor: ColorManager.materialColor(ColorManager.error));
}

ButtonStyle btnStyle({Color? color = Colors.indigo, EdgeInsets? padding}) {
  return ButtonStyle(padding: padding!=null ?MaterialStateProperty.all<EdgeInsets>(padding):null,backgroundColor: ColorManager.materialColor(color));
}

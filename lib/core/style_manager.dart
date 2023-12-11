import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts_manger.dart';

dynamic _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontsManager.fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// bold
dynamic getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeightManager.bold, color);
}

//semi bold
dynamic getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeightManager.semiBold, color);
}

//medium
dynamic getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeightManager.medium, color);
}

//regular
dynamic getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeightManager.regular, color);
}

//light
 dynamic getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontsWeightManager.light, color);
}

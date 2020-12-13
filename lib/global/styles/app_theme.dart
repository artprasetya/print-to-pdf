import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.blue,
    fontFamily: 'FazzNeue',
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[700],
    accentColor: Colors.purple[300],
    fontFamily: 'FazzNeue',
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.purple[300],
      disabledColor: Colors.grey[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    cursorColor: Colors.purple[300],
    toggleableActiveColor: Colors.purple[300],
  ),
};

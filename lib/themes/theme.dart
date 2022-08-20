import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: AppTheme.primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppTheme.secondaryColor),
    ),
  ),
);

class AppTheme {
  static const primaryColor = Color(0xffedebeb);
  static const secondaryColor = Color(0xff49a0fc);
  static const primaryDark = Colors.grey;
  static const secondaryDark = Color(0xff3f5ffc);
}

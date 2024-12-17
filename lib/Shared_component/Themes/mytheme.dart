import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Shared_component/Themes/colors.dart';

class MyTheme {
  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        color: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ))),
  );
}

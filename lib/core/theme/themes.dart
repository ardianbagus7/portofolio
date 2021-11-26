import 'package:flutter/material.dart';

mixin Themes {
  static Color kPrimaryColor = const Color(0xffC0392B); //#C0392B

  static final light = ThemeData.light().copyWith(
    primaryColorLight: kPrimaryColor,
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    highlightColor: Colors.black,
    canvasColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
  );
  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColorDark: kPrimaryColor,
    primaryColor: kPrimaryColor,
    highlightColor: kPrimaryColor,
    canvasColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kPrimaryColor),
  );
}

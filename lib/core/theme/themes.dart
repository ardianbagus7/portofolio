import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  // static Color kPrimaryColor = const Color(0xffC0392B); //#C0392B
  static Color kPrimaryColor = const Color.fromRGBO(21, 181, 114, 1);
  static Color kBackgroundColor = const Color.fromRGBO(7, 17, 26, 1);
  static Color kDangerColor = const Color.fromRGBO(249, 77, 30, 1);
  static Color kCaptionColor = const Color.fromRGBO(166, 177, 187, 1);

  static final light = ThemeData.light().copyWith(
    primaryColorLight: kPrimaryColor,
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    highlightColor: Colors.black,
    canvasColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    textTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme),
  );
  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kBackgroundColor,
    primaryColor: kPrimaryColor,
    canvasColor: kBackgroundColor,
    textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
  );
}

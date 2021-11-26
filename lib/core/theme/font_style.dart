import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  // Simple
  static TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 26,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300,
    ),
  );

  static TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
  );

  static TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 14,
      letterSpacing: 1,
    ),
  );

  static TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 14,
    ),
  );

  static TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 14,
      letterSpacing: 1,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

//To use the styles just write  style: appTheme().textTheme.headline2, in Text
ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const AppColors().midShade,
    fontFamily: 'Jost',
    textTheme: TextTheme(
      headline1: GoogleFonts.jost(
          fontSize: 40.0, fontWeight: FontWeight.w600, color: Colors.black),
      headline2: GoogleFonts.jost(
          fontSize: 24.0, fontWeight: FontWeight.w600, color: AppColors().brown),
      headline3: GoogleFonts.jost(
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
          color: Colors.black),
      headline4: GoogleFonts.jost(
          fontSize: 17.0,
          fontWeight: FontWeight.w300,
          color: AppColors.colors.lightestGrey),
      headline5: GoogleFonts.jost(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: AppColors.colors.brown),
      headline6: GoogleFonts.jost(
          fontSize: 14.0, fontWeight: FontWeight.w400, color: AppColors.colors.darkShade),
    ),
  );
}

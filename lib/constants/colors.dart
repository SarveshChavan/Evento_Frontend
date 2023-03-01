import 'package:flutter/material.dart';

@immutable
class AppColors {
  static const colors = AppColors();

  final midShade = const Color(0xFFED8C8C);//appbar,title,subtitle column
  final lightestShade = const Color(0xFFFFEEEE);//tab bar
  final lightShade = const Color(0xFFF7C9C9);
  final green = const Color(0xFF46DC00);
  final darkShade = const Color(0xFFEF7A7A);
  final darkestShade = const Color(0xFFD6738A);//text in tapbar
  final lightestGrey = const Color(0xFFE4E4E4);
  final brown= const Color(0xFF9A3838);

  const AppColors();
}

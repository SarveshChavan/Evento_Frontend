import 'package:flutter/material.dart';

@immutable
//Local URL
// This uri string only work when backend is fetched
// If you want to use this first get the backend repo and start the backend and change the ip address
// const String uri = 'http://192.168.82.180:5000/evento';
const String uri='https://evento-01og.onrender.com/evento';
class AppColors {
  static const colors = AppColors();
  final black = const Color(0xFF000000);
  final midShade = const Color(0xFFED8C8C);//appbar,title,subtitle column
  final lightestShade = const Color(0xFFFFEEEE);//tab bar
  final lightShade = const Color(0xFFF7C9C9);
  final green = const Color(0xFF59CE1F);
  final darkShade = const Color(0xFFEF7A7A);
  final darkestShade = const Color(0xFFD6738A);//text in tapbar
  final lightestGrey = const Color(0xFFE4E4E4);
  final brown= const Color(0xFFBB2A2A);
  final midDarkShade=const Color(0xFFFF7272);
  final grey = const Color(0xFF7C7C7C);
  final white = const Color(0xFFFFFFFF);
  final lightBlack = const Color (0x86262626);
  const AppColors();
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AlertButtton extends StatelessWidget {
  AlertButtton(
      {required this.function,
        required this.text,
        this.textColor = const Color(0xF5000000),
        this.buttonColor = const Color(0xFFFFFFFF),
        this.borderColor = const Color(0xF5000000),
        this.width = double.infinity,
        this.height = 40,
        Key? key})
      : super(key: key);

  void Function() function;
  String text;
  Color textColor, buttonColor, borderColor;
  double width,height;
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: unnecessary_null_comparison, prefer_if_null_operators
      width: width != null ? width : double.infinity,
      // ignore: unnecessary_null_comparison, prefer_if_null_operators
      height:height != null ? height : 30 ,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(style: BorderStyle.solid, color: borderColor),
            )),
        child: Text(
          text,
          style: GoogleFonts.jost(
              fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
        ),
      ),
    );
  }
}

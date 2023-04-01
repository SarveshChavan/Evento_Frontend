import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key,required this.controller,required this.label, this.lines = 1}) : super(key: key);

  TextEditingController controller;
  String label;
  int lines;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextField(
        maxLines: lines,
        controller: controller,
        cursorColor: AppColors.colors.grey,
        style: TextStyle(
          color: AppColors.colors.grey,
        ),
        decoration: InputDecoration(
            focusColor: AppColors.colors.midDarkShade,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(
              color: AppColors.colors.grey,
            ),
            filled: true,
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: AppColors.colors.lightestShade,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                    width: 0, style: BorderStyle.none)),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.colors.darkShade),
              borderRadius: BorderRadius.circular(10.0),
            )),
      ),
    );
  }
}

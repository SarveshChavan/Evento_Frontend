import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.data,
      required this.style,
      this.top = 5})
      : super(key: key);

  String data;
  TextStyle? style;
  double top;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only( top: top),
      child: Text(
        data,
        style: style,
      ),
    );
  }
}




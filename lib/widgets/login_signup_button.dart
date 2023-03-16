import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInSignUpButton extends StatefulWidget {
  LogInSignUpButton({Key? key, required this.text, required this.isLogin, required this.onTap, this.buttonColor= const Color(0xFFFF7272)}) : super(key: key);
  final String text;
  final bool isLogin;
  final Function onTap;
  final Color buttonColor;
  @override
  State<LogInSignUpButton> createState() => _LogInSignUpButtonState();
}

class _LogInSignUpButtonState extends State<LogInSignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      // color: AppColors.colors.darkShade,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(90),
      ),
      child: ElevatedButton(
        onPressed: (){
          widget.onTap();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return widget.buttonColor;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
            )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                widget.text,
                style: appTheme().textTheme.headline2?.copyWith(
                    color: Colors.white,
                    fontSize: 16
                )
            ),
            widget.isLogin ? const Icon(
                Icons.arrow_forward
            ): const SizedBox()
          ],
        ),

      ),
    );
  }
}


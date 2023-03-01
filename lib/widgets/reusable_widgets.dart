import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextFieldWidget extends StatefulWidget {
  final String text;
  final IconData prefix_icon;
  final bool isSuffix;
  final IconData suffix_icon;
  late bool isPasswordType;
  final TextEditingController controller;

  TextFieldWidget(@required this.text, @required this.prefix_icon, @required this.isSuffix, this.suffix_icon, @required this.isPasswordType, @required this.controller);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        obscureText: widget.isPasswordType,
        autocorrect: !widget.isPasswordType,
        cursorColor: AppColors.colors.grey,
        style: TextStyle(
          color: AppColors.colors.grey,
        ),
        decoration: InputDecoration(
            focusColor: AppColors.colors.midDarkShade,
            prefixIcon: Icon(
              widget.prefix_icon,
              color: AppColors.colors.darkShade,
            ),
            suffixIcon: widget.isSuffix ? IconButton(
              onPressed: () {
                setState(() {
                  widget.isPasswordType = !widget.isPasswordType;
                }
                );
              },
              icon: widget.isPasswordType ? Icon(
                widget.suffix_icon,
                color: AppColors.colors.darkShade,
              ): Icon(
                CupertinoIcons.eye_slash_fill,
                color: AppColors.colors.grey,
              ),
            ): SizedBox(),

            labelText: widget.text,
            labelStyle: TextStyle(
              color: AppColors.colors.grey,),
            filled: true,
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: AppColors.colors.lightestShade,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.colors.darkShade
              ),
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        keyboardType: widget.isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress
    );
  }
}


Container LogInSignUpButton(BuildContext context, String text, bool isLogin, Function onTap) {
  return Container(

    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    // color: AppColors.colors.darkShade,
    decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        Text(
          text,
          style: appTheme().textTheme.headline2?.copyWith(
              color: Colors.white,
            fontSize: 16
          )
        ),
          isLogin ? Icon(
            Icons.arrow_forward
          ): SizedBox()
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          // if (states.contains(MaterialState.pressed)) {
          //   return Colors.black26;
          // }
          return AppColors.colors.darkShade;
        }),

        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),

    ),
  );
}

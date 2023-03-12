import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

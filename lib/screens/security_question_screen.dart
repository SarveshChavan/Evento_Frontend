import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/screens/ongoing_screen.dart';
import 'package:events/screens/signin_screen.dart';
import 'package:events/widgets/security_question_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/login_signup_button.dart';

class SecurityQuestion extends StatefulWidget {
  static const routeName = 'SecurityQuestion';

  @override
  State<SecurityQuestion> createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends State<SecurityQuestion> {
  TextEditingController _answerTextController = TextEditingController();
  SecurityDropDown question_selected = new SecurityDropDown();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white70
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Please add a Security Question',
                  style: appTheme().textTheme.headline3?.copyWith(
                      color: AppColors.colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'It will help you in change password',
                  style: appTheme().textTheme.headline3?.copyWith(
                      color: AppColors.colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                question_selected,
                SizedBox(
                  height: 20,
                ),
            TextField(
                controller: _answerTextController,
                cursorColor: AppColors.colors.grey,
                style: TextStyle(
                  color: AppColors.colors.grey,
                ),
                decoration: InputDecoration(
                    focusColor: AppColors.colors.midDarkShade,
                    labelText: 'Answer',
                    floatingLabelBehavior: FloatingLabelBehavior.never,

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

            ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: LogInSignUpButton(context, 'Signup', false, () {
                    print(question_selected.selectedQuestion);
                    print(_answerTextController.text);
                    Navigator.pushNamed(context, ongoingScreen.routeName);
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

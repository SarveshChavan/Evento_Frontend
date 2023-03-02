

import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/screens/home_screen.dart';
import 'package:events/screens/security_question_screen.dart';
import 'package:events/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text(
      //     'Next',
      //     style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
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
                  'Evento',
                  style: appTheme().textTheme.headline3?.copyWith(
                    color: AppColors.colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Create an Account',
              style: appTheme().textTheme.headline3?.copyWith(
                  color: AppColors.colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
                SizedBox(
                  height: 40,
                ),
                TextFieldWidget(
                    'Enter email',
                    CupertinoIcons.mail_solid,
                    false,
                    Icons.account_circle_rounded,
                    false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    'Enter Username',
                    CupertinoIcons.person_alt,
                    false,
                    Icons.account_circle_rounded,
                    false,
                    _userNameTextController),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    'Enter password',
                    CupertinoIcons.lock_fill,
                    true,
                    CupertinoIcons.eye_fill,
                    true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    'Confirm password',
                    CupertinoIcons.lock_fill,
                    true,
                    CupertinoIcons.eye_fill,
                    true,
                    _confirmPasswordController),
                const SizedBox(
                  height: 20,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: LogInSignUpButton(context, 'Next', true,
                          // if password and confirm password not equal then it should focus on confirmPassword TextField
                          _passwordTextController.text==_confirmPasswordController.text?
                              () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text).then((value) {
                          print("Created acc");
                          Navigator.pushNamed(context, SecurityQuestion.routeName);
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }:(){}
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                ),
                Center(child: SignInOtption())

              ],
            ),
          ),
        ),
      ),
    );
  }

  Column SignInOtption() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
            "Already have an account? ",
            style: appTheme().textTheme.headline3?.copyWith(
              fontSize: 16,
            )
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignInScreen.routeName);
          },
          child: Text(
              "Sign In here!",
              style: appTheme().textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors().brown
              )
          ),
        )
      ],
    );
  }
}

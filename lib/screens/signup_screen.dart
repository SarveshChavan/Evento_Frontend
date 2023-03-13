import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/screens/security_question_screen.dart';
import 'package:events/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/login_signup_button.dart';

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
      body: SingleChildScrollView(
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
                  text: 'Enter email',
                  prefix_icon: CupertinoIcons.mail_solid,
                  isSuffix: false,
                  suffix_icon: Icons.account_circle_rounded,
                  isPasswordType: false,
                  controller: _emailTextController,  ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  text: 'Enter Username',
                  prefix_icon: CupertinoIcons.person_alt,
                  isSuffix: false,
                  suffix_icon: Icons.account_circle_rounded,
                  isPasswordType: false,
                  controller: _userNameTextController),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  text: 'Enter password',
                  prefix_icon: CupertinoIcons.lock_fill,
                  isSuffix: true,
                  suffix_icon: CupertinoIcons.eye_fill,
                  isPasswordType: true,
                  controller: _passwordTextController),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  text: 'Enter Confirm password',
                  prefix_icon: CupertinoIcons.lock_fill,
                  isSuffix: true,
                  suffix_icon: CupertinoIcons.eye_fill,
                  isPasswordType: true,
                  controller: _confirmPasswordController),
              const SizedBox(
                height: 20,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: LogInSignUpButton(context, 'Next', true,
                        // if password and confirm password not equal then it should focus on confirmPassword TextField
                        _passwordTextController.text==_confirmPasswordController.text?
                            () {
                              Navigator.pushNamed(context, SecurityQuestion.routeName, arguments: {
                                'email':_emailTextController.text,
                                'password':_passwordTextController.text,
                                'userName':_userNameTextController.text
                              });
                }:(){}
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
              Center(
                  child: Column(
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
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

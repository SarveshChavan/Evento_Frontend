import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/screens/bottomNavgation_bar.dart';
import 'package:events/screens/ongoing_screen.dart';
import 'package:events/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_signup_button.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "SignInScreen";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://wallpapercave.com/uwp/uwp2279327.png',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.height * 0.04, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Welcome',
                    style: appTheme().textTheme.headline2?.copyWith(
                      color: AppColors.colors.brown
                    )
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Sign In',
                    style: appTheme().textTheme.headline4?.copyWith(
                      color: AppColors.colors.brown,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                      'Enter email',
                      CupertinoIcons.mail_solid,
                      false,
                      Icons.account_circle_rounded,
                      false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                      'Enter password',
                      CupertinoIcons.lock_fill,
                      true,
                      CupertinoIcons.eye_fill,
                      true,
                      _passwordTextController),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Forget Password?',
                          style: appTheme().textTheme.headline3?.copyWith(
                            color: AppColors.colors.brown
                          )
                        ),
                        LogInSignUpButton(context, 'Login', true, () {
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text).then((value) => {
                          Navigator.pushNamed(context, ongoingScreen.routeName),
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                            throw Future.error(error!);
                          });
                          Navigator.pushNamed(context, bottomnavigation_bar.routeName);
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.15,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "Don't have an account? ",
                      style: appTheme().textTheme.headline3?.copyWith(
                        fontSize: 16,
                      )
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: Text(
                        "Sign Up",
                        style: appTheme().textTheme.headline3?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().brown
                        )
                    ),
                  )
                ],
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

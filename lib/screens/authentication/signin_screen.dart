import 'package:events/Services/auth_services.dart';
import 'package:events/constants/colors.dart';
import 'package:events/constants/handler.dart';
import 'package:events/constants/theme.dart';
import 'package:events/screens/bottomNavgation_bar.dart';
import 'package:events/screens/profile/profile_details.dart';
import 'package:events/screens/authentication/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/login_signup_button.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "SignInScreen";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  late SharedPreferences prefs;
  late String token;
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
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.04, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Welcome',
                      style: appTheme()
                          .textTheme
                          .headline2
                          ?.copyWith(color: AppColors.colors.brown)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Sign In',
                    style: appTheme().textTheme.headline4?.copyWith(
                        color: AppColors.colors.brown,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    text: 'Enter email',
                    isSuffix: false,
                    suffixIcon: Icons.account_circle_rounded,
                    isPasswordType: false,
                    controller: _emailTextController,
                    prefixIcon: CupertinoIcons.mail_solid,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                      text: 'Enter password',
                      prefixIcon: CupertinoIcons.lock_fill,
                      isSuffix: true,
                      suffixIcon: CupertinoIcons.eye_fill,
                      isPasswordType: true,
                      controller: _passwordTextController),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Forget Password?',
                            style: appTheme()
                                .textTheme
                                .headline3
                                ?.copyWith(color: AppColors.colors.brown)),
                        LogInSignUpButton(
                          text: 'Login',
                          isLogin: true,
                          onTap: () async {
                            await AuthService().loginUser(
                                context: context,
                                email: _emailTextController.text,
                                password: _passwordTextController.text);
                            prefs = await SharedPreferences.getInstance();
                            token = prefs.getString('token') ?? '';
                            if (token != null && token != '') {
                              Navigator.pushNamed(
                                  context, bottomnavigation_bar.routeName);
                            }else{
                              Navigator.pushNamed(context, SignUpScreen.routeName);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.075,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? ",
                            style: appTheme().textTheme.headline3?.copyWith(
                                  fontSize: 16,
                                )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                          child: Text("Sign Up",
                              style: appTheme().textTheme.headline3?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors().brown)),
                        )
                      ],
                    ),
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

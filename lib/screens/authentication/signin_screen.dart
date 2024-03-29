import 'package:events/Services/auth_services.dart';
import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/models/navigation_item.dart';
import 'package:events/screens/authentication/signup_screen.dart';
import 'package:events/screens/home_wrapper.dart';
import 'package:events/screens/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/navigationProvider.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/dialogue_box.dart';
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
                              Provider.of<NavigationProvider>(context,listen: false).setNavigationItem(NavigationItem.home);
                              Navigator.pushNamed(
                                  context, Loading.routeName);
                            }else{
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomFrame(
                                        title: 'User Not Exist',
                                        button2Text: 'Ok',
                                        description:
                                        'Please Register First And Then Login',
                                        function: () {
                                          Navigator.push(
                                              (context),
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpScreen()));
                                        });
                                  });
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

import 'package:events/screens/signup_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/reusable_widgets.dart';
// import 'home_screen.dart';

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xffDA4453),
            Color(0xff89216B),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget('assets/images/evento_logo.png'),
                TextFieldWidget('Enter email', Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget('Enter passwor', Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                // LogInSignUpButton(context, true, () {
                //   FirebaseAuth.instance.signInWithEmailAndPassword(
                //       email: _emailTextController.text,
                //       password: _passwordTextController.text).then((value) => {
                //   // Navigator.pushNamed(context, HomeScreen.routeName),
                //   }).onError((error, stackTrace) {
                //     print("Error ${error.toString()}");
                //     throw Future.error(error!);
                //   });
                // }),
                const SizedBox(
                  height: 20,
                ),
                SignUpOtption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row SignUpOtption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

// import 'package:events/screens/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                TextFieldWidget('Enter Username', Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget('Enter email', Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget('Enter password', Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                // LogInSignUpButton(context, false, () {
                //   FirebaseAuth.instance.createUserWithEmailAndPassword(
                //       email: _emailTextController.text,
                //       password: _passwordTextController.text).then((value) {
                //         print("Created acc");
                //     // Navigator.pushNamed(context, HomeScreen.routeName);
                //   }).onError((error, stackTrace) {
                //     print("Error ${error.toString()}");
                //   });
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

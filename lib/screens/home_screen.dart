import 'dart:math';
import 'package:events/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/event_card.dart';

class HomeScreen extends StatelessWidget {
  static const  routeName = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Event',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) => {
                  print("signed out"),
                Navigator.pushNamed(context, SignInScreen.routeName)
                });
              },
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          EventCard(),
          EventCard(),
        ],
      ),
    );
  }
}

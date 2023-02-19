import 'dart:math';
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
          'Evento',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
              onPressed: () {},
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

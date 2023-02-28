import 'package:flutter/material.dart';

class ongoingScreen extends StatefulWidget {
  const ongoingScreen({Key? key}) : super(key: key);

  @override
  State<ongoingScreen> createState() => _ongoingScreenState();
}

class _ongoingScreenState extends State<ongoingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("ho"),),
    );
  }
}

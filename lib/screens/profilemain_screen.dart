import 'package:flutter/material.dart';

class profilemain_Screen extends StatefulWidget {
  const profilemain_Screen({Key? key}) : super(key: key);

  @override
  State<profilemain_Screen> createState() => _profilemain_ScreenState();
}

class _profilemain_ScreenState extends State<profilemain_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
      ),
    );
  }
}

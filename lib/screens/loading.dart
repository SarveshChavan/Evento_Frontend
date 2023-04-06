import 'package:events/screens/home_wrapper.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  static const String routeName = "loading";
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomeWrapper.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          value: 20,
        ),
      ),
    );
  }
}

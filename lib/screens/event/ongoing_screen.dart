import 'dart:core';
import 'package:flutter/material.dart';
import '../../widgets/newevent_cards.dart';

class OngoingScreen extends StatefulWidget {
  static const routeName = 'ongoingScreen';
  const OngoingScreen({Key? key}) : super(key: key);

  @override
  State<OngoingScreen> createState() => _OngoingScreenState();
}

class _OngoingScreenState extends State<OngoingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: Container(
          margin: EdgeInsets.only(left: 20,),
          // padding: EdgeInsets.symmetric(vertical: ),
          // margin: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Tech")
                  ],
                ),
                Container(
                  height: 260,
                  child: ListView.separated(
                    shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                      itemCount: eventList.length,
                      itemBuilder: (context,index){

                    return eventsListviewwidget(eventObject: eventList[index] ,);
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10,);
                  },),
                ),
                SizedBox(height: 20,),
                Row(

                  children: [
                    Text("Non-tech")
                  ],
                ),
                Container(
                  height: 260,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: eventList2.length,
                    itemBuilder: (context,index){

                      return eventsListviewwidget2(eventObject2: eventList2[index] ,);
                    }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10,);
                  },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


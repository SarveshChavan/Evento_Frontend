import 'dart:core';
import 'package:events/models/event.dart';
import 'package:flutter/material.dart';
import '../../constants/theme.dart';
import '../../widgets/event_card.dart';

class OngoingScreen extends StatefulWidget {
  static const routeName = 'ongoingScreen';
  OngoingScreen({Key? key, required this.ongoing}) : super(key: key);
  List ongoing;
  @override
  State<OngoingScreen> createState() => _OngoingScreenState();
}

class _OngoingScreenState extends State<OngoingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'Tech',
                style: appTheme().textTheme.headline3,
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.ongoing.isNotEmpty
                    ? widget.ongoing
                        .map((e) => e['category'] == 'Tech'
                            ? EventCard(
                                id: e['_id'].toString(),
                                eventPhoto: e['eventPhoto'].toString(),
                                eventName: e['eventName'].toString(),
                                category: e['category'].toString())
                            : SizedBox())
                        .toList()
                    : [],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'Entertainment',
                style: appTheme().textTheme.headline3,
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.ongoing.isNotEmpty
                    ? widget.ongoing
                        .map((e) => e['category'] != 'Tech'
                            ? EventCard(
                                id: e['_id'].toString(),
                                eventPhoto: e['eventPhoto'].toString(),
                                eventName: e['eventName'].toString(),
                                category: e['category'].toString())
                            : SizedBox())
                        .toList()
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

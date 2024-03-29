import 'dart:core';
import 'package:events/constants/colors.dart';
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
  List tech = [], entertainment = [], other = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < widget.ongoing.length; i++) {
      if (widget.ongoing[i]['category'] == 'Technology') {
        tech.add(widget.ongoing[i]);
      } else if (widget.ongoing[i]['category'] == 'Other') {
        other.add(widget.ongoing[i]);
      } else {
        entertainment.add(widget.ongoing[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (tech.isEmpty || entertainment.isEmpty || other.isEmpty)
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'No Events Available',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colors.grey),
                  ),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            tech.isEmpty
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      'Technology',
                      style: appTheme().textTheme.headline3,
                    ),
                  ),
            tech.isNotEmpty
                ? SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: tech
                            .map((e) => EventCard(
                                id: e['_id'].toString(),
                                eventPhoto: e['eventPhoto'].toString(),
                                eventName: e['eventName'].toString(),
                                category: e['category'].toString()))
                            .toList()),
                  )
                : SizedBox(),
            entertainment.isEmpty
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      'Entertainment',
                      style: appTheme().textTheme.headline3,
                    ),
                  ),
            entertainment.isNotEmpty
                ? SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: entertainment
                            .map((e) => EventCard(
                                id: e['_id'].toString(),
                                eventPhoto: e['eventPhoto'].toString(),
                                eventName: e['eventName'].toString(),
                                category: e['category'].toString()))
                            .toList()),
                  )
                : SizedBox(),
            other.isEmpty
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      'Other',
                      style: appTheme().textTheme.headline3,
                    ),
                  ),
            other.isNotEmpty
                ? SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: other
                            .map((e) => EventCard(
                                id: e['_id'].toString(),
                                eventPhoto: e['eventPhoto'].toString(),
                                eventName: e['eventName'].toString(),
                                category: e['category'].toString()))
                            .toList()),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

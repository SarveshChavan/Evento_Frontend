import 'dart:core';
import 'package:events/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/theme.dart';
import '../../models/event.dart';
import '../../widgets/event_card.dart';

class PastEventScreen extends StatefulWidget {
  PastEventScreen({Key? key, required this.past}) : super(key: key);
  List past;
  @override
  State<PastEventScreen> createState() => _PastEventScreenState();
}

class _PastEventScreenState extends State<PastEventScreen> {
  String currentDate = DateFormat("dd-MM-yyy").format(DateTime.now());
  List tech = [], entertainment = [], other = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < widget.past.length; i++) {
      if (widget.past[i]['category'] == 'Technology') {
        tech.add(widget.past[i]);
      } else if (widget.past[i]['category'] == 'Other') {
        other.add(widget.past[i]);
      } else {
        entertainment.add(widget.past[i]);
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

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.colors.lightestGrey),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030));
                  if (pickedDate != null) {
                    // print(pickedDate);
                    setState(() {
                      String dateFormat =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      // print(dateformat);
                      currentDate = dateFormat;
                    });
                  }
                },
                child: Text(
                  "Sort by Events ",
                  style: TextStyle(color: AppColors.colors.darkestShade),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text("25/01/23"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'Tech',
                style: appTheme().textTheme.headline3,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: widget.past.isNotEmpty
                    ? widget.past
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
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: widget.past.isNotEmpty
                    ? widget.past
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

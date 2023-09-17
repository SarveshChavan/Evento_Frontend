import 'dart:core';
import 'package:events/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/theme.dart';
import '../../models/event.dart';
import '../../widgets/event_card.dart';

class UpcomingEventScreen extends StatefulWidget {
  UpcomingEventScreen({Key? key, required this.upcoming}) : super(key: key);
  List upcoming;

  @override
  State<UpcomingEventScreen> createState() => _UpcomingEventScreenState();
}

class _UpcomingEventScreenState extends State<UpcomingEventScreen> {
  String currentDate = DateFormat("dd-MM-yyy").format(DateTime.now());
  List tech=[],entertainment=[],other=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<widget.upcoming.length;i++){
      if(widget.upcoming[i]['category']=='Tech'){
        tech.add(widget.upcoming[i]);
      }else if(widget.upcoming[i]['category']=='Other'){
        other.add(widget.upcoming[i]);
      }else{
        entertainment.add(widget.upcoming[i]);
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
            // Center(
            //   child: TextButton(
            //     style: TextButton.styleFrom(
            //         backgroundColor: AppColors.colors.lightestGrey),
            //     onPressed: () async {
            //       DateTime? pickedDate = await showDatePicker(
            //           context: context,
            //           initialDate: DateTime.now(),
            //           firstDate: DateTime(2000),
            //           lastDate: DateTime(2030));
            //       if (pickedDate != null) {
            //         // print(pickedDate);
            //         setState(() {
            //           String dateFormat =
            //               DateFormat('dd-MM-yyyy').format(pickedDate);
            //           // print(dateformat);
            //           currentDate = dateFormat;
            //         });
            //       }
            //     },
            //     child: Text(
            //       "Sort by Events ",
            //       style: TextStyle(color: AppColors.colors.darkestShade),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Center(
            //   child: Text("25/01/23"),
            // ),
            SizedBox(
              height: 10,
            ),
            tech.isEmpty?SizedBox():Padding(
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
                children:tech.isNotEmpty?
                tech
                    .map((e) => e['category'] == 'Tech'
                    ? EventCard(
                    id: e['_id'].toString(),
                    eventPhoto: e['eventPhoto'].toString(),
                    eventName: e['eventName'].toString(),
                    category: e['category'].toString())
                    : SizedBox())
                    .toList():[Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: Text("No Events Found")),
                )],
              ),
            ),
            entertainment.isEmpty?SizedBox():Padding(
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
                children: entertainment.isNotEmpty?entertainment
                    .map((e) => e['category'] == 'Entertainment'
                    ? EventCard(
                    id: e['_id'].toString(),
                    eventPhoto: e['eventPhoto'].toString(),
                    eventName: e['eventName'].toString(),
                    category: e['category'].toString())
                    : SizedBox())
                    .toList():[Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: Text("No Events Found")),
                )],
              ),
            ),
            other.isEmpty?SizedBox():Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'Other',
                style: appTheme().textTheme.headline3,
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: other.isNotEmpty?other
                    .map((e) => e['category'] != 'Other'
                    ? EventCard(
                    id: e['_id'].toString(),
                    eventPhoto: e['eventPhoto'].toString(),
                    eventName: e['eventName'].toString(),
                    category: e['category'].toString())
                    : SizedBox())
                    .toList():[Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: Text("No Events Found")),
                )],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Services/event_services.dart';

class OthersEventPage extends StatefulWidget {
  OthersEventPage({Key? key, required this.id}) : super(key: key);
  static const String routeName = "eventPageOthers";
  String id;
  @override
  State<OthersEventPage> createState() => _OthersEventPageState();
}

class _OthersEventPageState extends State<OthersEventPage> {
  String hostEmail = "";
  String userName = "";
  String category = "";
  String eventName = "";
  String address = "";
  bool isFree = true;
  String eventDateTime = "";
  String eventStatus = "";
  String eventPhoto = "";
  String eventDescription = "";
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EventServices().getEventById(
      context: context,
      eventId: widget.id,
      onFetch: (data) {
        setState(() {
          hostEmail = data!.hostEmail;
          category = data!.category;
          address = data!.address;
          eventPhoto = data!.eventPhoto;
          eventName = data!.eventName;
          eventDescription = data!.eventDescription;
          eventDateTime = data!.eventDateTime;
          eventStatus = data!.eventStatus;
          isFree = data!.isFree.toString() == "true";
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          value: 20,
        ),
      ),
    ):Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image(
            image: NetworkImage(eventPhoto),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 25,
          left: 10,
          child: Container(
            child: IconButton(
              color: AppColors.colors.white,
              icon: Icon(
                Icons.arrow_back,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            decoration: BoxDecoration(
                color: AppColors.colors.lightBlack,
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
        Positioned(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 275),
            decoration: BoxDecoration(
              color: AppColors.colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      data: eventName, style: appTheme().textTheme.headline1),
                  CustomText(
                      data: "Category: $category",
                      style: appTheme().textTheme.headline4),
                  CustomText(
                      data: 'Date: $eventDateTime',
                      style: appTheme().textTheme.headline4),
                  CustomText(
                      data: 'Venue: $address',
                      style: appTheme().textTheme.headline3),
                  CustomText(
                      data: eventDescription,
                      style: appTheme().textTheme.headline3?.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 19)),
                  CustomText(
                      data: 'Hosted By: $hostEmail',
                      style: appTheme().textTheme.headline3),
                  CustomText(
                      data: 'Connect To Host:'
                          '$hostEmail',
                      style: appTheme().textTheme.headline3),
                  CustomText(
                      data: 'Its Free Event',
                      style: appTheme().textTheme.headline3),
                ],
              ),
            ),
          ),
        ),
      ],
    )));
  }
}

import 'dart:ui';

import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class eventPageothers extends StatelessWidget {
  eventPageothers({Key? key}) : super(key: key);

  String hostEmail = "abc@gmai.com";
  String userName = "Kishimito";
  String category = "Adventure";
  String eventName = "Naruto";
  String address = "Building Block 5, Hidden Leaf,\n Fire content, 475788";
  bool isFree = true;
  String eventDateTime = "22/01/2023";
  String eventStatus = "ongoing";
  String eventPhoto = "assets/images/anime.jpg";
  String eventDescription =
      "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. A young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. Naruto is generally a very simple minded, easy going, cheerful person. He often rushes things, and misses obvious things.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image(
            image: NetworkImage(
                "https://avatarfiles.alphacoders.com/206/thumb-206822.jpg"),
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
              onPressed: () {},
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
                      data: 'Hosted By: $userName',
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

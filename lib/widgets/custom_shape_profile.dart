import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/theme.dart';
import 'custom_shape.dart';

class CustomShapeProfile extends StatefulWidget {
  const CustomShapeProfile({Key? key, required this.width, this.img, this.pickImage, required this.userName, required this.photoUrl, this.isProfilePhotoChange=true, }) : super(key: key);
  final double width;
  final File ?img;
  final Function()? pickImage;
  final String userName;
  final String photoUrl;
  final bool isProfilePhotoChange;
  @override
  State<CustomShapeProfile> createState() => _CustomShapeProfileState();
}

class _CustomShapeProfileState extends State<CustomShapeProfile> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CustomShape(),
            Positioned(
              left: 1.19 * widget.width / 4,
              top: 0,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade50,
                    radius: 80,
                    child: CircleAvatar(
                      radius: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            backgroundColor: AppColors.colors.lightShade,
                            backgroundImage:  NetworkImage(widget.photoUrl),
                            radius: 140,
                          )),
                    ),
                  ),
                  widget.isProfilePhotoChange?Positioned(
                      left: 120,
                      top: 120,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: IconButton(
                          onPressed: () {
                            widget.pickImage!();
                          },
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: AppColors.colors.brown,
                          ),
                        ),
                      )):SizedBox(),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.userName,
              style: appTheme().textTheme.headline2,
            ),
          ],
        ),
      ],
    );
  }}

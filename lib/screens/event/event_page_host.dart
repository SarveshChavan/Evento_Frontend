import 'package:events/Services/event_services.dart';
import 'package:events/screens/home_wrapper.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/theme.dart';
import '../../constants/widgets.dart';

class HostEventPage extends StatefulWidget {
  HostEventPage({Key? key, required this.id}) : super(key: key);
  static const String routeName = "eventPageHost";

  String id;
  @override
  State<HostEventPage> createState() => _HostEventPageState();
}

class _HostEventPageState extends State<HostEventPage> {
  String hostEmail = "";
  String category = "Adventure";
  String eventName = "Naruto";
  String address = "Building Block 5, Hidden Leaf,\n Fire content, 475788";
  bool isFree = true;
  String eventDateTime = "22/01/2023";
  String eventStatus = "ongoing";
  String eventPhoto =
      "https://avatarfiles.alphacoders.com/206/thumb-206822.jpg";
  String eventDescription = "";
  bool startEvent = false, isLoading = true;

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
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                value: 20,
              ),
            ),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                            image: DecorationImage(
                                image: NetworkImage(eventPhoto),
                                fit: BoxFit.cover)),
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                                data: eventName,
                                style: appTheme().textTheme.headline1),
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
                    ],
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
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeWrapper.routeName, (route) => false);
                        },
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.colors.lightBlack,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  // Positioned(
                  //     bottom: 20,
                  //     left: 20,
                  //     child: Row(
                  //       children: [
                  //         if (startEvent == false)
                  //           ElevatedButton(
                  //             onPressed: () {},
                  //             style: ButtonStyle(
                  //                 backgroundColor:
                  //                 MaterialStateProperty.resolveWith((states) {
                  //                   return AppColors.colors.green;
                  //                 }),
                  //                 shape: MaterialStateProperty.all<
                  //                     RoundedRectangleBorder>(
                  //                     RoundedRectangleBorder(
                  //                         borderRadius:
                  //                         BorderRadius.circular(30)))),
                  //             child: Text(
                  //               'Start',
                  //               style: appTheme()
                  //                   .textTheme
                  //                   .headline2
                  //                   ?.copyWith(color: AppColors.colors.white),
                  //             ),
                  //           ),
                  //         ElevatedButton(
                  //           onPressed: () {
                  //             ;
                  //           },
                  //           style: ButtonStyle(
                  //               backgroundColor:
                  //               MaterialStateProperty.resolveWith((states) {
                  //                 return AppColors.colors.brown;
                  //               }),
                  //               shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //                   RoundedRectangleBorder(
                  //                       borderRadius: BorderRadius.circular(30)))),
                  //           child: Text(
                  //             startEvent ? "End" : 'Delete',
                  //             style: appTheme()
                  //                 .textTheme
                  //                 .headline2
                  //                 ?.copyWith(color: AppColors.colors.white),
                  //           ),
                  //         )
                  //       ],
                  //     ))
                ],
              ),
            ),
          );
  }
}

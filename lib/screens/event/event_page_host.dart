import 'package:events/Services/event_services.dart';
import 'package:events/screens/home_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
                ],
              ),
            ),
            floatingActionButton: eventStatus!='completed'?SpeedDial(
              backgroundColor: AppColors.colors.darkShade,
              animatedIcon: AnimatedIcons.menu_close,
              overlayColor: AppColors.colors.white,
              childrenButtonSize: Size(65, 65),
              overlayOpacity: 0,
              children: [
                if (eventStatus == 'upcoming')
                  SpeedDialChild(
                    onTap: () async {
                      await EventServices().startEvent(
                          context: context,
                          id: widget.id,
                          hostEmail: hostEmail);
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeWrapper.routeName, (route) => false);
                    },
                    backgroundColor: AppColors.colors.green,
                    child: Icon(
                      Icons.event_available,
                      size: 35,
                      color: AppColors.colors.white,
                    ),
                    labelBackgroundColor: AppColors.colors.green,
                    label: 'Start',
                    labelStyle: appTheme()
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.colors.white),
                  ),
                SpeedDialChild(
                  onTap: () async {
                    eventStatus != 'upcoming'
                        ? await EventServices().endEvent(
                            context: context,
                            id: widget.id,
                            hostEmail: hostEmail)
                        : await EventServices()
                            .deleteEvent(context: context, eventId: widget.id);
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeWrapper.routeName, (route) => false);
                  },
                  backgroundColor: AppColors.colors.brown,
                  child: Icon(
                    eventStatus != 'upcoming' ? Icons.event_busy : Icons.delete,
                    color: AppColors.colors.white,
                    size: 35,
                  ),
                  labelBackgroundColor: AppColors.colors.brown.withOpacity(0.8),
                  label: eventStatus != 'upcoming' ? 'End' : 'Delete',
                  labelStyle: appTheme()
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColors.colors.white),
                )
              ],
            ):null,
          );
  }
}

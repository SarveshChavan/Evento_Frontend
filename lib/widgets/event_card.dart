import 'package:events/screens/event/event_page_host.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/event/event_page_others.dart';

class EventCard extends StatelessWidget {
  EventCard(
      {required this.eventPhoto,
      required this.eventName,
      required this.category,
      required this.id});
  String eventPhoto, eventName, category, id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HostEventPage.routeName,
            arguments: {'id': id});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(eventPhoto),
                height: 200,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.colors.midShade),
              child: Column(
                children: [Text(eventName), Text(category)],
              ),
            )
          ],
        ),
      ),
    );
  }
}

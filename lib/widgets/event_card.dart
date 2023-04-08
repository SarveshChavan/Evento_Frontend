import 'package:events/screens/event/event_page_host.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/theme.dart';
import '../models/navigation_item.dart';
import '../provider/navigationProvider.dart';
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
    NavigationItem navigationItem=Provider.of<NavigationProvider>(context).navigationItem;
    return GestureDetector(
      onTap: () {
        navigationItem==NavigationItem.yourEvents?Navigator.pushNamed(context, HostEventPage.routeName,
            arguments: {'id': id}):Navigator.pushNamed(context, OthersEventPage.routeName,
            arguments: {'id': id});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(eventPhoto),
                height: 220,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 160,
              height: 58,
              decoration: BoxDecoration(
                  color: AppColors.colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventName,style:appTheme().textTheme.headline6?.copyWith(fontWeight: FontWeight.w700,color: Colors.white)),
                    Text(category,style:appTheme().textTheme.headline6?.copyWith(fontWeight: FontWeight.w700,color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

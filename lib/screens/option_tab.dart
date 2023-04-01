import 'package:flutter/material.dart';
import 'package:events/constants/colors.dart';
import 'event/ongoing_screen.dart';
import 'event/pastevent_screen.dart';
import 'event/upcoming_event.dart';

class OptionTab extends StatefulWidget {
  const OptionTab({Key? key}) : super(key: key);

  @override
  State<OptionTab> createState() => _OptionTabState();
}

class _OptionTabState extends State<OptionTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Container(
              // height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.colors.lightestShade,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 25, spreadRadius: 10, color: Colors.black54)
                  ]),

              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.colors.midShade,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    height: 60,
                    width: double.infinity,
                    child: Center(child: Text("Evento")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          "Ongoing",
                          style:
                              TextStyle(color: AppColors.colors.darkestShade),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Upcoming",
                          style:
                              TextStyle(color: AppColors.colors.darkestShade),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "past",
                          style:
                              TextStyle(color: AppColors.colors.darkestShade),
                        ),
                      ),
                    ],
                    indicatorColor: AppColors.colors.darkestShade,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                OngoingScreen(),
                UpcomingEventScreen(),
                PastEventScreen()
              ]),
            )
          ],
        ),
      )),
    );
  }
}

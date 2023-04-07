import 'package:events/constants/colors.dart';
import 'package:events/screens/event/add_event.dart';
import 'package:events/screens/option_tab.dart';
import 'package:events/screens/profile/profile_details.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);
  static const String routeName = "HomeWrapper";
  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int currenttab = 0;
  final List<Widget> screen = [
    OptionTab(),
    //TODO add hamburger menu instead of profile details
    ProfileDetails(),
  ];
  Widget currentScreen = OptionTab();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              bottomRight: Radius.circular(35)),
          child: DrawerWidget()
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.colors.midShade,
        onPressed: () {
          Navigator.pushNamed(context, AddEvent.routeName);
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }
}

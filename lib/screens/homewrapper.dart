import 'package:events/constants/colors.dart';
import 'package:events/screens/menu_screen.dart';
import 'package:events/screens/profile_details.dart';
import 'package:events/screens/profilemain_screen.dart';
import 'package:flutter/material.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);
  static const String routeName = "homeWrapper";
  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int currenttab = 0;
  final List<Widget> screen = [
    TabView(),
    //TODO add hamburger menu instead of profile details
    ProfileDetails(),
  ];
  Widget currentScreen = TabView();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.colors.midShade,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: AppColors.colors.midShade,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
              onPressed: () {
                setState(() {
                  currentScreen = TabView();
                  currenttab = 0;
                });
              },
              icon: Icon(
                Icons.home,
                color: AppColors.colors.lightestGrey,
                size: 40,
              ),
            ),
            IconButton(
              padding: EdgeInsets.only(right: 30,top: 0),
              onPressed: () {
                setState(() {
                  currentScreen = ProfileDetails();
                  currenttab = 1;
                });
              },
              icon: Icon(
                Icons.person,
                color: AppColors.colors.lightestGrey,
                size: 40,
              ),
            ),
          ],
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }
}

import 'package:events/constants/colors.dart';
import 'package:events/screens/menu_screen.dart';
import 'package:events/screens/profilemain_screen.dart';
import 'package:flutter/material.dart';

class bottomnavigation_bar extends StatefulWidget {
  static const routeName = 'bottomnavigation_bar';
  const bottomnavigation_bar({Key? key}) : super(key: key);

  @override
  State<bottomnavigation_bar> createState() => _bottomnavigation_barState();
}

class _bottomnavigation_barState extends State<bottomnavigation_bar> {
int currenttab=0;
  final List<Widget> screen=[
    menuScreen(),
    profilemain_Screen(),
  ];
  Widget currentScreen=menuScreen();
  final PageStorageBucket bucket=PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.colors.midShade,
        onPressed: () {  },
        child: Icon(Icons.add,size: 40,),


      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      height: 60,
      color: AppColors.colors.midShade,
      shape: CircularNotchedRectangle(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(

              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: MaterialButton(
                      minWidth: 40,
                      onPressed: (){

                    setState(() {
                      currentScreen=menuScreen();
                      currenttab=0;
                    });


                  },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,color: AppColors.colors.lightestGrey,size: 40,),

                      ],
                    ),

                  ),
                ),


              ],
            ),
            Row(

              children: [

                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: (){

                      setState(() {
                        currentScreen=profilemain_Screen();
                        currenttab=1;
                      });


                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,color: AppColors.colors.lightestGrey,size: 40,),

                      ],
                    ),

                  ),
                ),

              ],
            )
          ],
        ),
      ),
    ),
    body: PageStorage(
      bucket: bucket, child: currentScreen,
    ),
    );
  }
}


import 'package:events/screens/ongoing_screen.dart';
import 'package:events/screens/pastevent_screen.dart';
import 'package:events/screens/upcomingevent_screen.dart';
import 'package:flutter/material.dart';
import 'package:events/constants/colors.dart';
class menuScreen extends StatefulWidget {
  const menuScreen({Key? key}) : super(key: key);

  @override
  State<menuScreen> createState() => _menuScreenState();
}

class _menuScreenState extends State<menuScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    length: 3,
      child: Scaffold(


     body: Stack(
       children: [
         Container(
           padding: EdgeInsets.only(top: 100),
           height: 148,
           decoration: BoxDecoration(color: AppColors.colors.lightestShade,  boxShadow: [
             BoxShadow(
                 blurRadius: 5,
                 color: Colors.black54
             )
           ],),
           child: Column(
             children: [
               TabBar(

                   tabs: [

                 Tab(
                   child: Text("Ongoing Events",style: TextStyle(color: AppColors.colors.darkestShade),),
                 ),
                 Tab(
                   child: Text("Upcoming Events",style: TextStyle(color: AppColors.colors.darkestShade),),
                 ),
                 Tab(
                   child: Text("past Events",style: TextStyle(color: AppColors.colors.darkestShade),),
                 ),
               ],
               indicatorColor: AppColors.colors.darkestShade,
               ),
               Expanded(
                 child: TabBarView(children: [
                   ongoingScreen(),
                   upcomingeventScreen(),
                   pasteventScreen()
                 ]),
               )
             ],
           ),
         ),
         Container(

           height: 90,
           decoration: BoxDecoration(

               color: AppColors.colors.midShade,
           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
           ),
         child:Center(child: Container(
           padding: EdgeInsets.only(top: 30),
           child: Text("Evento"),),),
         )
       ],

     ),

      ),

    );
  }
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class eventClass {
  String? imgurl;
  String? title;
  String? subtitle;

  eventClass({this.imgurl, this.title, this.subtitle});
}

class eventClass2 {
  String? imgurl;
  String? title;
  String? subtitle;

  eventClass2({this.imgurl, this.title, this.subtitle});
}

List<eventClass> eventList=[
  eventClass(imgurl: "assets/images/anime.jpg",
      title: "Title",
      subtitle: "Subtitle"
  ),
  eventClass(imgurl: "assets/images/anime.jpg",
      title: "Title",
      subtitle: "Subtitle"
  ),
  eventClass(imgurl: "assets/images/anime.jpg",
      title: "Title",
      subtitle: "Subtitle"
  ),
  eventClass(imgurl: "assets/images/anime.jpg",
      title: "Title",
      subtitle: "Subtitle"
  ),

];
List<eventClass2> eventList2=[
  eventClass2(imgurl: "assets/images/anime.jpg",
      title: "Title",
      subtitle: "Subtitle"
  ),
  eventClass2(imgurl: "assets/images/anime.jpg",
      title: "Title",
      subtitle: "Subtitle"
  ),
  eventClass2(imgurl: "assets/images/anime.jpg",
      title: "Title",
      subtitle: "Subtitle"
  ),
  eventClass2(imgurl: "assets/images/anime.jpg",
      title: "Title",
      subtitle: "Subtitle"
  ),

];

class eventsListviewwidget extends StatelessWidget {
  eventClass eventObject=eventClass();
  eventsListviewwidget({required this.eventObject});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: 200,
      child:Column(
        children: [
          Container(
            height: 200,
            width: 170,
            // width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/anime.jpg"),

              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15) ,
                  color:AppColors.colors.midShade
              ),
              child: Column(
                children: [
                  Text("TITLE"),
                  Text("SUBTITLE")
                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
}


class eventsListviewwidget2 extends StatelessWidget {
  eventClass2 eventObject2=eventClass2();
  eventsListviewwidget2({required this.eventObject2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: 200,
      child:Column(
        children: [
          Container(
            height: 200,
            width: 170,
            // width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/anime.jpg"),

              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15) ,
                  color:AppColors.colors.midShade
              ),
              child: Column(
                children: [
                  Text("TITLE"),
                  Text("SUBTITLE")
                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
}
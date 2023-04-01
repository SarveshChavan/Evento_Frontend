import 'dart:core';
import 'package:events/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/new_event_cards.dart';

class UpcomingEventScreen extends StatefulWidget {
  const UpcomingEventScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingEventScreen> createState() => _UpcomingEventScreenState();
}

class _UpcomingEventScreenState extends State<UpcomingEventScreen> {


 String currentDate=DateFormat("dd-MM-yyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20,),
        padding: EdgeInsets.symmetric(vertical: 15),
        // margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: AppColors.colors.lightestGrey),
                  onPressed: ()async{
                    DateTime? pickedDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime(2000), lastDate: DateTime(2030));
                  if(pickedDate!=null)
                    {
                      // print(pickedDate);
                      setState(() {
                        String dateformat=DateFormat('dd-MM-yyyy').format(pickedDate);
                        // print(dateformat);
                        currentDate=dateformat;
                      });

                    }


                    }, child: Text("Sort by Events ",style: TextStyle(color: AppColors.colors.darkestShade),),),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text("${currentDate}"),
              ),
              SizedBox(height: 10,),
              Row(

                children: [
                  Text("Tech")
                ],
              ),
              Container(
                height: 260,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: eventList.length,
                  itemBuilder: (context,index){

                    return eventsListviewwidget(eventObject: eventList[index] ,);
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10,);
                },),
              ),
              SizedBox(height: 20,),
              Row(

                children: [
                  Text("Non-tech")
                ],
              ),
              Container(
                height: 260,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: eventList2.length,
                  itemBuilder: (context,index){

                    return eventsListviewwidget2(eventObject2: eventList2[index] ,);
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10,);
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}


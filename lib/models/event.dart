import 'package:flutter/foundation.dart';

class Event{
  String ? id;
  String ? hostEmail;
  String ? eventName;
  String ? category;
  String ? address;
  String ? isFree;
  String ? eventDateTime;
  String ? eventStatus;
  String ? eventPhoto;
  String ? eventDescription;

  Event({
    this.id,
    this.hostEmail,
    this.eventName,
    this.category,
    this.address,
    this.isFree,
    this.eventDateTime,
    this.eventStatus,
    this.eventPhoto,
    this.eventDescription
  });
  factory Event.fromJson(Map<String,dynamic> map){
    return Event(
        id: map['_id']??'',
        hostEmail: map["hostEmail"],
        eventName: map['eventName'],
        category: map['category'],
        address: map['address'],
        isFree: 'true',
        eventDateTime: map['eventDateTime'],
        eventStatus: map['eventStatus'],
        eventPhoto:map['eventPhoto'],
      eventDescription: map['eventDescription']
    );
  }
  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "hostEmail":hostEmail,
      "eventName":eventName,
      "category":category,
      "address":address,
      "isFree":isFree,
      "eventDateTime":eventDateTime,
      "eventStatus":eventStatus,
      "eventPhoto":eventPhoto,
      "eventDescription":eventDescription
    };
  }
}
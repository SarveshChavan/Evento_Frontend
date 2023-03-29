import 'package:flutter/foundation.dart';

class EventoUser{
  String ? email;
  String ? userName;
  String ? totalEvents;
  String ? password;
  String ? securityQuestion;
  String ? securityAnswer;
  String ? profilePhoto;
  String ? userDescription;

  EventoUser({
    this.email,
    this.password,
    this.profilePhoto,
    this.securityAnswer,
    this.securityQuestion,
    this.userName,
    this.userDescription,
    this.totalEvents
  });
  factory EventoUser.fromJson(Map<String,dynamic> map){
    return EventoUser(
      email: map["email"],
      userName: map['userName'],
      password: map['password'],
      securityQuestion: map['securityQuestion'],
      securityAnswer: map['securityAnswer'],
      profilePhoto: map['profilePhoto'],
      userDescription: map['userDescription'],
      totalEvents:map['totalEvents']
    );
  }
  Map<String,dynamic> toJson(){
    return{
      "email":email,
      "userName":userName,
      "userDescription":userDescription,
      "password":password,
      "securityQuestion":securityQuestion,
      "securityAnswer":securityAnswer,
      "profilePhoto":profilePhoto,
      "events":totalEvents
    };
  }
  EventoUser copyWith(
      {
        String? email,
        String? userName,
        String? userDescription,
        String? password,
        String? securityQuestion,
        String? profilePhoto,
        String? securityAnswer,
        String? totalEvents,
        }) {
    return EventoUser(
        email: email??this.email,
        userName: userName??this.userName,
        password: userDescription??this.userDescription,
        securityQuestion: securityQuestion??this.securityQuestion,
        securityAnswer: securityAnswer??this.securityAnswer,
        profilePhoto:profilePhoto??this.profilePhoto,
        userDescription: userDescription??this.userDescription,
        totalEvents:totalEvents??this.totalEvents
    );

  }
}
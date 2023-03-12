import 'package:flutter/foundation.dart';

class User{
  String ? email;
  String ? userName;
  String ? events;
  String ? password;
  String ? securityQuestion;
  String ? securityAnswer;
  String ? profilePhoto;
  String ? userDescription;

  User({
    this.email,
    this.password,
    this.profilePhoto,
    this.securityAnswer,
    this.securityQuestion,
    this.userName,
    this.userDescription,
    this.events
  });
  factory User.fromJson(Map<String,dynamic> map){
    return User(
      email: map["email"],
      userName: map['userName'],
      password: map['password'],
      securityQuestion: map['securityQuestion'],
      securityAnswer: map['securityAnswer'],
      profilePhoto: map['profilePhoto'],
      userDescription: map['userDescription'],
      events:map['events']
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
      "events":events
    };
  }
}
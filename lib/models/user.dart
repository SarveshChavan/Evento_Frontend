import 'package:flutter/foundation.dart';

class User{
  String ? email;
  String ? userName;
  String ? gender;
  String ? password;
  String ? securityQuestion;
  String ? securityAnswer;
  String ? profilePhoto;
  String ? userDescription;
  String ? token;

  User({
    this.email,
    this.gender,
    this.password,
    this.profilePhoto,
    this.securityAnswer,
    this.securityQuestion,
    this.userName,
    this.token,
    this.userDescription
  });
  factory User.fromMap(Map<String,dynamic> map){
    return User(
      email: map["email"],
      userName: map['userName'],
      gender: map['gender'],
      password: map['password'],
      securityQuestion: map['securityQuestion'],
      securityAnswer: map['securityAnswer'],
      profilePhoto: map['profilePhoto'],
      userDescription: map['userDescription'],
      token: map['token'],
    );
  }
  Map<String,dynamic> toMap(){
    return{
      "email":email,
      "userName":userName,
      "userDescription":userDescription,
      "gender":gender,
      "password":password,
      "securityQuestion":securityQuestion,
      "securityAnswer":securityAnswer,
      "profilePhoto":profilePhoto,
      "token":token,
    };
  }
}
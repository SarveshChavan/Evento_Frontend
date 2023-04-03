import 'package:events/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier{
  EventoUser _user=EventoUser(
    email: '',
    userName: '',
    totalEvents: '',
    password: '',
    securityQuestion: '',
    securityAnswer: '',
    profilePhoto: '',
    userDescription: '',
  );
  void createUser(EventoUser user){
    _user=user;
    print(_user.userName);
    notifyListeners();
  }
  void updateUser(EventoUser user){
    _user=user;
    notifyListeners();
  }
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _user=EventoUser(
      email: '',
      userName: '',
      totalEvents: '',
      password: '',
      securityQuestion: '',
      securityAnswer: '',
      profilePhoto: '',
      userDescription: '',
    );
    notifyListeners();
  }
  EventoUser getUser(){
    return _user;
  }
  String getProfilePhoto(){
    return _user.profilePhoto.toString();
  }
  String getUserEmail(){
    return _user.email.toString();
  }
  String getUserDescription(){
    return _user.userDescription.toString();
  }
}
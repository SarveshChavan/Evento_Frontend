import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/handler.dart';
import '../models/user.dart';

class AuthService {
  Future<User> registerUser({
    required BuildContext context,
    required String userName,
    required String email,
    required String password,
    required String securityQuestion,
    required String securityAnswer,
    // required Function onFetch,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String uid = prefs.getString('auth-token') ?? '';

    User user = User(
      email: email,
      userName: userName,
      password: password,
      securityQuestion: securityQuestion,
      securityAnswer: securityAnswer,
      profilePhoto: '',
      userDescription: '',
      totalEvents: '0',
    );
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/register'),
        body: user.toJson(),
        headers: <String, String>{
          'api_key':'123456'
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User userModel = User.fromJson(jsonDecode(res.body)['user']);
          prefs.setString('token',jsonDecode(res.body)['token'] ).then((value) => {
            print(prefs.getString('token')),
            // Provider.of<UserProvider>(context, listen: false)
            //     .setUser(userModel)
          });
          prefs.setString('userEmail',email).then((value) => {
            print(prefs.getString('userEmail')),
            // Provider.of<UserProvider>(context, listen: false)
            //     .setUser(userModel)
          });
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return user;
  }

  Future<bool> loginUser({
    required BuildContext context,
    required String email,
    required String password,
    // required Function onFetch,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String uid = prefs.getString('auth-token') ?? '';

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/login?email=$email&password=$password'),
        headers: <String, String>{
          'api_key':'123456',
          'authorization':'Bearer $email',
        },

      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User userModel = User.fromJson(jsonDecode(res.body)['user']);
          prefs.clear();
          prefs.setString('token',jsonDecode(res.body)['token'] ).then((value) => {
            print(prefs.getString('token')),
            // Provider.of<UserProvider>(context, listen: false)
            //     .setUser(userModel)
          });
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return true;
  }

  Future<bool> checkUser(
      {required BuildContext context, required String email,}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token= prefs.getString('token')!;
    http.Response res = await http.get(
      Uri.parse('$uri/user'),
      headers: <String, String>{
        'authorization':'Bearer $email',
        'api_key':'123456',
        'token': token
      },
    );
    return jsonDecode(res.body)['isUser'];
  }
}

void test() async {
  http.Response res = await http.get(Uri.parse('$uri/'));
  // ignore: avoid_print
  print(res.body);
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/handler.dart';
import '../models/user.dart';
import '../provider/userProvider.dart';

class AuthService {
  Future<EventoUser> registerUser({
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
    prefs.clear();
    EventoUser user = EventoUser(
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
        headers: <String, String>{'api_key': '123456'},
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          EventoUser userModel =
              EventoUser.fromJson(jsonDecode(res.body)['user']);
          prefs
              .setString('token', jsonDecode(res.body)['token'])
              .then((value) => {
                    print(prefs.getString('token')),
                    prefs.setString('userEmail', email).then((value) => {
                          print(prefs.getString('userEmail')),
                          Provider.of<UserProvider>(context, listen: false)
                              .createUser(userModel)
                        })
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
          'api_key': '123456',
          'authorization': 'Bearer $email',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          EventoUser userModel =
              EventoUser.fromJson(jsonDecode(res.body)['user']);
          prefs.clear();
          prefs
              .setString('token', jsonDecode(res.body)['token'])
              .then((value) => {
                    print(prefs.getString('token')),
                    prefs.setString('userEmail', email).then((value) => {
                          print(prefs.getString('userEmail')),
                          Provider.of<UserProvider>(context, listen: false)
                              .createUser(userModel)
                        })
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

  Future<bool> checkUser({
    required BuildContext context,
    required String email,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    http.Response res = await http.get(
      Uri.parse('$uri/user'),
      headers: <String, String>{
        'authorization': 'Bearer $email',
        'api_key': '123456',
        'token': token
      },
    );
    return jsonDecode(res.body)['isUser'];
  }

  Future<void> updateUser(
      {required BuildContext context,
      required String email,
      required String profilePhoto,
      required String userDescription
      // required Function onFetch,
      }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String uid = prefs.getString('auth-token') ?? '';
    String? token = prefs.getString('token');
    try {
      http.Response res = await http.put(
        Uri.parse('$uri/user?email=$email'),
        body: {
          'profilePhoto': profilePhoto,
          'userDescription': userDescription
        },
        headers: <String, String>{
          'api_key': '123456',
          'authorization': 'Bearer $email',
          'token': token.toString()
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          EventoUser userModel =
              EventoUser.fromJson(jsonDecode(res.body)['user']);
          Provider.of<UserProvider>(context, listen: false)
              .updateUser(userModel);
          print('user updated');
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> changePassword({
    required BuildContext context,
    required String email,
    required String securityQuestion,
    required String securityAnswer,
    required String newPassword,
    // required Function onFetch,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String uid = prefs.getString('auth-token') ?? '';
    String token = prefs.getString('token')!;
    try {
      http.Response res = await http.put(
        Uri.parse('$uri/password?email=$email'),
        body: {
          'securityQuestion': securityQuestion,
          'securityAnswer': securityAnswer,
          'newPassword': newPassword
        },
        headers: <String, String>{
          'api_key': '123456',
          'authorization': 'Bearer $email',
          'token': token
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('Password Updated in mongo');
          print(jsonDecode(res.body)['password']);
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

void test() async {
  http.Response res = await http.get(Uri.parse('$uri/'));
  // ignore: avoid_print
  print(res.body);
}

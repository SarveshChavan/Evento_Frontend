import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/handler.dart';
import '../models/event.dart';

class EventServices{
  Future<Event> createEvent({
    required BuildContext context,
    required String eventName,
    required String hostEmail,
    required String category,
    required String address,
    required String eventDateTime,
    required String eventStatus,
    required String eventPhoto,
    required String eventDescription,
    required String isFree,
    // required Function onFetch,
  }) async {
    // String uid = prefs.getString('auth-token') ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Event event = Event(
        hostEmail: hostEmail,
        eventName: eventName,
        category: category,
        address: address,
        isFree: 'true',
        eventDateTime: eventDateTime,
        eventStatus: eventStatus,
        eventPhoto:eventPhoto,
        eventDescription: eventDescription
    );
    String token= prefs.getString('token')!;
    String userEmail=prefs.getString('userEmail')!;
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/event'),
        body: event.toJson(),
        headers: <String, String>{
          'api_key':'123456',
          'authorization':'Bearer $userEmail',
          'token':token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('Event Created');
          Event eventModel = Event.fromJson(jsonDecode(res.body)['event']);
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return event;
  }
  Future<void> endEvent({
    required BuildContext context,
    required String id,
    required String hostEmail,
    // required Function onFetch,
  }) async {
    // String uid = prefs.getString('auth-token') ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token= prefs.getString('token')!;
    String userEmail=prefs.getString('userEmail')!;
    try {
      http.Response res = await http.put(
        Uri.parse('$uri/event/end?email=$hostEmail&_id=$id'),
        headers: <String, String>{
          'api_key':'123456',
          'authorization':'Bearer $userEmail',
          'token':token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('Event ended ');
          //TODO: First change the status in provider and then backend status
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
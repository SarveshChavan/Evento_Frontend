import 'dart:convert';
import 'package:events/provider/userProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/handler.dart';
import '../models/event.dart';
import '../models/navigation_item.dart';
import '../provider/navigationProvider.dart';

class EventServices {
  Future<EventoEvent> createEvent({
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    EventoEvent event = EventoEvent(
        hostEmail: hostEmail,
        eventName: eventName,
        category: category,
        address: address,
        isFree: isFree,
        eventDateTime: eventDateTime,
        eventStatus: eventStatus,
        eventPhoto: eventPhoto,
        eventDescription: eventDescription);
    String token = prefs.getString('token') ?? '';
    String userEmail = prefs.getString('userEmail') ?? '';
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/event'),
        body: event.toJson(),
        headers: <String, String>{
          'api_key': '123456',
          'authorization': 'Bearer $userEmail',
          'token': token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('Event Created');
          EventoEvent eventModel =
              EventoEvent.fromJson(jsonDecode(res.body)['event']);
          print(eventModel.id);
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
    String token = prefs.getString('token')!;
    String userEmail = prefs.getString('userEmail')!;
    try {
      http.Response res = await http.put(
        Uri.parse('$uri/event/end?email=$hostEmail&_id=$id'),
        headers: <String, String>{
          'api_key': '123456',
          'authorization': 'Bearer $userEmail',
          'token': token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: ()  {
          Provider.of<UserProvider>(context,listen: false).incrementEvent();
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

  Future<void> deleteEvent({
    required BuildContext context,
    required String eventId,
    // required Function onFetch,
  }) async {
    // String uid = prefs.getString('auth-token') ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    String userEmail = prefs.getString('userEmail')!;
    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/event?eventId=$eventId'),
        headers: <String, String>{
          'api_key': '123456',
          'authorization': 'Bearer $userEmail',
          'token': token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('Event deleted');
          //TODO: First change the status in provider and then backend status
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getEventById({
    required BuildContext context,
    required String eventId,
    required Function onFetch,
  }) async {
    EventoEvent e = EventoEvent();
    // String uid = prefs.getString('auth-token') ?? '';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    String userEmail = prefs.getString('userEmail')!;
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/event?eventId=$eventId'),
        headers: <String, String>{
          'api_key': '123456',
          'authorization': 'Bearer $userEmail',
          'token': token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('Event got by id');
          e = EventoEvent.fromJson(jsonDecode(res.body)['eventDetails']);
          onFetch(e);
          print(e.hostEmail);
          //TODO: First change the status in provider and then backend status
        },
      );
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  void getEvents({
    required BuildContext context,
    required Function onFetch,
  }) async {
    // String uid = prefs.getString('auth-token') ?? '';
    String? type;
    NavigationItem item=Provider.of<NavigationProvider>(context,listen: false).navigationItem;
    if(item==NavigationItem.yourEvents){
        type='host';
    }else if(item==NavigationItem.home){
        type='user';
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    String userEmail = prefs.getString('userEmail')!;
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/event/type?email=$userEmail&type=$type'),
        headers: <String, String>{
          'api_key': '123456',
          'authorization': 'Bearer $userEmail',
          'token': token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('$uri/event/type?email=$userEmail&type=$type');
          onFetch(Map<String, dynamic>.from(jsonDecode(res.body)));
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> startEvent({
    required BuildContext context,
    required String id,
    required String hostEmail,
    // required Function onFetch,
  }) async {
    // String uid = prefs.getString('auth-token') ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    String userEmail = prefs.getString('userEmail')!;
    try {
      http.Response res = await http.put(
        Uri.parse('$uri/event?email=$hostEmail&_id=$id'),
        headers: <String, String>{
          'api_key': '123456',
          'authorization': 'Bearer $userEmail',
          'token': token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('Event Started ');
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

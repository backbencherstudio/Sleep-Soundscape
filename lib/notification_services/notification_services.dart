import 'dart:convert';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationServices {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  //Initialize Firebase Messaging
  Future<void> initialize() async {

    //Initialize local notifications
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings("@mipmap/launcher_icon");

    const InitializationSettings initializationSettings =
    InitializationSettings(android: androidInitializationSettings);

    await _localNotificationsPlugin.initialize(initializationSettings);


  }

  static scheduledNotification(){}

  //Foreground message handler
  Future<void> _onMessageHandler() async {

  }

  static Future<void> _showNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'general_channel', // Channel ID
        'General Notifications', // Channel Name
        importance: Importance.high,
        priority: Priority.high,
        icon: "@mipmap/launcher_icon");

    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

    await _localNotificationsPlugin.show(
      _notificationId,
      title,
      body,
      notificationDetails,
    );
  }




}
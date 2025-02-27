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

  static scheduledNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'important_notification', // Channel ID
        'Sleep SoundScape App', // Channel Name
        importance: Importance.max,
        priority: Priority.high,
        icon: "@mipmap/launcher_icon");

    var iosDetails = const DarwinNotificationDetails();

    var notificationDetails =
    NotificationDetails(android: androidNotificationDetails,iOS: iosDetails);

    await _localNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle
    );

  }

}
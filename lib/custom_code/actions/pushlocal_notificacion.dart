// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future pushlocalNotificacion(
  String titulo,
  String texto,
) async {
  // Add your function code here!
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = DarwinInitializationSettings();
  final initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    settings: initializationSettings,
    onDidReceiveNotificationResponse: (_) {},
  );

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'random_channel_id', 'channel_name',
      channelDescription: 'lpn_encuestas',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      groupKey: 'com.daangu.encuestas',
      ticker: 'ticker',
      color: Color.fromARGB(255, 170, 33, 243));
  var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    id: 0,
    title: titulo,
    body: texto,
    notificationDetails: platformChannelSpecifics,
    payload: 'Encuestas',
  );
}

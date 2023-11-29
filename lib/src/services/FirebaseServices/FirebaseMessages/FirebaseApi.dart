import 'dart:async';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your App'),
        ),
        body: Center(
          child: Text('Your App Content'),
        ),
      ),
    );
  }
}

class FirebaseApi {
  final FirebaseMessaging _message = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNoti() async {
    await _message.requestPermission();
    final fcmtoken = await _message.getToken();

    print('TOKEN: $fcmtoken');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground Message received: ${message.notification?.title}");
      print("Foreground Body: ${message.notification?.body}");

      // Handle the notification in the foreground
      _showLocalNotification(message);
    });

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // Use the default launcher icon
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title:${message.notification?.title}');
    print('Body${message.notification?.body}');
    print('Payload ${message.data}');

    await _showLocalNotification(message);
  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    final Random random = Random();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'my_app_notifications', // Match the channel ID in AndroidManifest.xml
      'Notificaciones de MyApp',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await FlutterLocalNotificationsPlugin().show(
      random.nextInt(100), // ID de la notificación
      message.notification?.title ?? 'Notificación',
      message.notification?.body ?? 'Cuerpo de la notificación',
      platformChannelSpecifics,
    );
  }
}

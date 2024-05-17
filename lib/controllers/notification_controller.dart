import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oasis/models/notification_model.dart';
import 'package:oasis/views/ui/profile/notifications.screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print(message.notification?.title);
  print(message.notification?.body);
  print(message.data);
}

class NotificationController {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for important notification',
      importance: Importance.defaultImportance);
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) return;

    navigatorKey.currentState
        ?.pushNamed(NotificationScreen.route, arguments: message);
  }

  Future initLocalNotifications() async {
    var android = new AndroidInitializationSettings('@mipmap/launcher_icon');
    var settings = InitializationSettings(android: android);
    await _localNotifications.initialize(
        settings,
        onDidReceiveNotificationResponse: (payload) {
          if (payload != null) {
            final message = RemoteMessage.fromMap(jsonDecode(payload as String));
            handleMessage(message);
          }
        });
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> saveNotification(Notification notification) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notificationsList = prefs.getStringList('notifications') ?? [];
    notificationsList.add(jsonEncode(notification.toJson()));
    await prefs.setStringList('notifications', notificationsList);
  }


  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification != null) {
        final Notification myNotification = Notification(
          title: notification.title ?? '',
          body: notification.body ?? '',
        );
        saveNotification(myNotification);
      }
      _localNotifications.show(
        notification.hashCode,
        notification?.title,
        notification?.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              _androidChannel.id, _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@mipmap/launcher_icon'
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print(fCMToken);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();
    initLocalNotifications();
  }
}

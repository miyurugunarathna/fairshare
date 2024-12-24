import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:fairshare/components/common/core/push_notification.dart';
import 'package:fairshare/services/core/cache.service.dart';

class FCMService {
  static final PushNotificationSnackBar _notificationSnackBar = PushNotificationSnackBar();

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    if (kDebugMode) {
      print("Handling a background message: ${message.notification?.title}");
    }
  }

  static Future initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        await CacheService.setFCMToken(token);
      }
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _notificationSnackBar.show(
        title: message.notification?.title ?? "",
        description: message.notification?.body ?? "",
        durationInSecond: 5,
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    messaging.onTokenRefresh.listen((newToken) async {
      final token = await CacheService.getFCMToken();
      if (newToken != token) {
        CacheService.setFCMToken(newToken);
      }
    });
  }
}

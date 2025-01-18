// import 'dart:convert';
// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:splinder/core/db/app_db.dart';
// import 'package:splinder/values/export.dart';
//
// import '../ui/home/bloc/home_bloc.dart';
//
// class PushNotificationsManager {
//   PushNotificationsManager._();
//
//   factory PushNotificationsManager() => instance;
//
//   static final PushNotificationsManager instance = PushNotificationsManager._();
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   AndroidNotificationChannel channel = const AndroidNotificationChannel(
//       "high_importance_channel ", 'Customer Update',
//       description: 'channel_description',
//       importance: Importance.max,
//       playSound: true,
//       enableVibration: true,
//       showBadge: true,
//       sound: RawResourceAndroidNotificationSound('notification_sound'));
//
//   deleteNotification(String channelId) {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.deleteNotificationChannel(channelId);
//   }
//
//   Future<void> init() async {
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     if (Platform.isIOS) {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//     } else {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//     }
//
//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     _firebaseMessaging.getToken().then((String? token) {
//       appDB.fcmToken = token ?? '';
//       debugPrint("Push Messaging token: ${appDB.fcmToken}");
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//
//       debugPrint("====================initialMessage=======================");
//       debugPrint("Initial Message ${message.notification?.title}");
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         if (!appDB.isChatScreen) {
//           _showNotificationWithDefaultSound(message);
//         }
//       }
//       locator<HomeBloc>().add(UpdateNotificationBadgeEvent());
//     });
//
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//
//     if (initialMessage != null) {
//       debugPrint(
//           "====================initialMessage 2 =======================");
//       debugPrintRemoteMessage(initialMessage);
//     }
//
//     // Also handle any interactˇ˘ion when the app is in the background via a
//     // Stream listener
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint(
//           "====================onMessageOpenedApp=======================");
//       debugPrintRemoteMessage(message);
//
//       updateNavigation(message.data);
//     });
//
//     var android = const AndroidInitializationSettings('@drawable/new_app_icon');
//     var ios = const DarwinInitializationSettings();
//     var platform = InitializationSettings(android: android, iOS: ios);
//     flutterLocalNotificationsPlugin.initialize(
//       platform,
//       onDidReceiveNotificationResponse: (details) {
//         debugPrint(
//             "====================onSelectNotification=======================");
//         debugPrint(details.payload);
//         updateNavigation(jsonDecode(details.payload!));
//       },
//     );
//   }
//
//   Future _showNotificationWithDefaultSound(RemoteMessage payload) async {
//     var data = payload.data;
//
//     AndroidNotificationDetails androidPlatformChannelSpecifics;
//
//     androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//         'default_notification_channel_id', 'push_notification',
//         channelDescription: 'channel_description',
//         importance: Importance.max,
//         priority: Priority.high,
//         ongoing: false,
//         playSound: false,
//         sound: null,
//         enableVibration: true,
//         autoCancel: true);
//
//     var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
//         sound: 'notification_sound.wav',
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: true);
//
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics);
//     var notification = payload.notification;
//
//     debugPrint("${payload.notification}  ${payload.data}");
//     debugPrint(
//         "====================_showNotificationWithDefaultSound=======================");
//     debugPrintRemoteMessage(payload);
//     /*if (data["tag"].toString() == "account_verification") {
//       // refreshController.requestRefresh();
//     }*/
//     // appDB.notificationPending = true;
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       notification?.title,
//       notification?.body,
//       platformChannelSpecifics,
//       payload: jsonEncode(payload.data),
//     );
//   }
//
//   debugPrintRemoteMessage(RemoteMessage message) {
//     debugPrint(
//         "Notification_TITLE: ${jsonEncode(message.notification?.title)}");
//     debugPrint("Notification_BODY: ${jsonEncode(message.notification?.body)}");
//     debugPrint("Data: ${jsonEncode(message.data)}");
//   }
// }
//
// void updateNavigation(Map<String, dynamic> data) async {
//   debugPrint("===============updateNavigation=================");
//   debugPrint(jsonEncode(data));
//
//   if (data.isNotEmpty) {
//     // Data received, navigate to the notification page
//     // if (!appDB.isLogin) {
//     //   return;
//     // }
//     locator<AppRouter>().replaceAll([HomeMainRoute(currentPage: 2)]);
//
//     //locator<AppRouter>().push(NotificationRoute());
//   } else {
//     // No data received, navigate to the chat page
//     if (!appDB.isLogin) {
//       return;
//     }
//     locator<AppRouter>().replaceAll([HomeMainRoute(currentPage: 0)]);
//     await Future.delayed(const Duration(seconds: 3), () {
//       locator<AppRouter>().push(
//         PersonalChatRoute(
//           responseModel: locator<AppDB>().offlineDating,
//         ),
//       );
//     });
//   }
//
//   debugPrint("*********************** tag *********************");
//   debugPrint(data["notification_type"]);
//   debugPrint(data["reference_id"]);
//   debugPrint("*********************** action id *********************");
// }

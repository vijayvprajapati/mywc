import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mywc/data/db/app_db.dart';
import 'package:mywc/locator/locator.dart';

//background notification handling
Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Background notification");
  await Firebase.initializeApp();
 // PushNotificationsManager.instance.debugPrintRemoteMessage(message);
}

Future<void> main() async {
  // runZonedGuarded is used for better traceability for errors, exceptions and debugging
  runZonedGuarded(
    () async {
     // WidgetsBinding widgetsBinding =
       WidgetsFlutterBinding.ensureInitialized();
      //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      // await Firebase.initializeApp(options: Platform.isIOS ? 
      // DefaultFirebaseOptions.currentPlatform : null);

      await setupLocator();
      await locator.isReady<LocalDB>();

      // Handling background notifications
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      //await PushNotificationsManager.instance.init();

      // Handling app terminated  notifications
      firebaseMessagingTerminatedHandler();

      // set error builder widget
      // ErrorWidget.builder = (FlutterErrorDetails erro
      // rDetails) {
      //   return CustomErrorWidget(errorDetails: errorDetails);
      // };

      //Pass all uncaught "fatal" errors from the framework to Crashlytics
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };
      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

      // SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent,
      //   statusBarBrightness: Brightness.light,
      //
      // );

      runApp(MyApp());
    },
    (error, stack) => (Object error, StackTrace stackTrace) {
      if (!kReleaseMode) {
        debugPrint('[Error]: $error');
        debugPrint('[Stacktrace]: $stackTrace');
      }
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: Size(),

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
         
          // your translations key
          locale:const Locale('en', 'IN'),
           theme: ThemeData(useMaterial3: false,),
          // navigatorObservers: [
          //   FirebaseAnalyticsObserver(analytics: analytics),
          // ],
        );
      },
    );
  }
}

// For handling notification when the app is in terminated state
Future firebaseMessagingTerminatedHandler() async {
  await Firebase.initializeApp();
  RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {
   // PushNotificationsManager.instance.debugPrintRemoteMessage(message);
  }
}

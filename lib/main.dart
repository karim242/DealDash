import 'package:dealdash/app.dart';
import 'package:dealdash/core/network_helper/dio_helper.dart.dart';
import 'package:dealdash/feature/search/data/repo/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/cache_helper/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  ServiceLocator().init();
//  await dotenv.load();
 // DioHelper.init();
  _setupFCM();
  runApp(const MyApp());
}

Future<void> _setupFCM() async {
  // You may set the permission requests to "provisional" which allows the user to choose what type
  // of notifications they would like to receive once the user receives a notification.
  final notificationSettings =
  await FirebaseMessaging.instance.requestPermission(
    provisional: true,
  );

  final token = await FirebaseMessaging.instance.getToken();
  print("FCM Token:------" + token.toString());
  CacheHelper.saveFCMToken(value: token.toString());

  // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
  // final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
  // if (apnsToken != null) {
  //   // APNS token is available, make FCM plugin API requests...
  // }

  // Listen for token refresh events
  // FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
  //   // TODO: If necessary send token to application server.
  //   // Note: This callback is fired at each app startup and whenever a new
  //   // token is generated.
  //   print("Token:-" + fcmToken);
  // }).onError((err) {
  //   // Error getting token.
  //   print("error:-" + err.toString());
  // });
}


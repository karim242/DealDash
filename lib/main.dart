

import 'package:dealdash/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/cache_helper/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  ServiceLocator().init();
  _setupFCM();
  runApp(const MyApp());
}

Future<void> _setupFCM() async {
  final notificationSettings =
  await FirebaseMessaging.instance.requestPermission(
    provisional: true,
  );
  final token = await FirebaseMessaging.instance.getToken();
  print("FCM Token:------" + token.toString());
  await SecureCacheHelper.saveFCMToken(value: token.toString());

}


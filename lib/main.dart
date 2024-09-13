import 'package:dealdash/app.dart';
import 'package:flutter/material.dart';

import 'core/cache_helper/cache_helper.dart';
import 'core/network_helper/dio_helper.dart.dart';
import 'core/services/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // await CacheHelper.init();
  ServiceLocator().init();
 // DioHelper.init();
  runApp(const MyApp());
}


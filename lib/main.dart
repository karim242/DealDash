import 'package:dealdash/app.dart';
import 'package:dealdash/core/network_helper/dio_helper.dart.dart';
import 'package:dealdash/feature/search/data/repo/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'core/cache_helper/cache_helper.dart';
import 'core/services/service_locator.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServiceLocator().init();
//  await dotenv.load();
 // DioHelper.init();

  runApp(const MyApp());
}


import 'package:dealdash/app.dart';
import 'package:flutter/material.dart';

import 'core/services/service_locator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // await CacheHelper.init();
  ServiceLocator().init();
   await dotenv.load();
 // DioHelper.init();
  runApp(const MyApp());
}


import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late  SharedPreferences sharedPreferences ;
  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static void saveToken({ required String value}){
    sharedPreferences.setString('auth_token', value);
  }
  static String? getToken(){
    return sharedPreferences.getString('auth_token');

  }
      static void saveString({required String key, required String value}){
    sharedPreferences.setString(key, value);
  }
  static String? getString({required String key,}){
    return sharedPreferences.getString(key);
  }
  }

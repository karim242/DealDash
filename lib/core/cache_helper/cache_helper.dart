import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late  SharedPreferences sharedPreferences ;
  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static void saveToken({ required String value}){
    sharedPreferences.setString('auth_token', value);
  }
  static String? getToken({required String key}){
    return sharedPreferences.getString('auth_token');
  }
}
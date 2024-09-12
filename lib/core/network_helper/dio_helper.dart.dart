import 'package:dio/dio.dart';
import '../resources/strings_manger/strings_manager.dart';

class DioHelper{
  static late Dio dio ;
  static init(){
    dio = Dio(
      BaseOptions(
        // baseUrl: UrlManager.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'lang' : 'en',
          'Content-Type' : 'application/json',
        }
      )
    );
  }
  static Future<Response?> getData({required String url,Map<String,dynamic>? query,String? token})async{
    return await dio.get(url,queryParameters: query,options:Options(
      headers: {
       'Authorization' : token
      }
    ));
  }
  static Future<Response?> postData({required String url,Map<String,dynamic>? query,required Map<String,dynamic> data,String? token })async{
    return await dio.post(url,queryParameters: query,data: data,options: Options(
      headers: {
        'Authorization' : token
      }
    ));
  }
  
}
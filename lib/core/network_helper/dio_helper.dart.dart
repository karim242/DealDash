import 'package:dealdash/core/error/failure.dart';
import 'package:dio/dio.dart';

class ApiService {
 
  final _baseUrl = 'https://dealdash-demo-v2-131caca18fa1.herokuapp.com';
  final Dio _dio;

ApiService(Dio dio)
    : _dio = dio..options = BaseOptions(
        connectTimeout: const Duration(seconds: 30),
     receiveTimeout: const Duration(seconds: 30), 
      ) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('طلب: ${options.method} ${options.path}');
        print('بيانات الطلب: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('رد: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        print('خطأ: ${e.response?.statusCode} ${e.message}');
        return handler.next(e);
      },
    ));
  }

  Future<Map<String, dynamic>> getData({
    required String endpoint,
    Map<String, dynamic>? query,
    String? token,
    String? fcmToken,
  }) async {
    try {
      final response = await _dio.get(
        '$_baseUrl$endpoint',
        queryParameters: query,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept-Language':'en',
            'Accept':'application/json',
            'FCM-Token': fcmToken,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
      
      return response.data;
      
    } else if(response.statusCode == 404){
      return response.data['message'];
    }
    else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  } on DioException catch (e) {
    handelDioException(e);
    rethrow;
  }
}

 Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> data,
    String? token,
   String? fcmToken,
  }) async {
    try {
      var response = await _dio.post(
        '$_baseUrl$endpoint',
        data: data,
        options: Options(
          headers: {
            'authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'FCM-Token': fcmToken,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }else if(response.statusCode == 404){
      return response.data['message'];
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  } on DioException catch (e) {
    handelDioException(e);
    rethrow;
  }
}
}
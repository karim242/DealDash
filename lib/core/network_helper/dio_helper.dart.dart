import 'package:dealdash/core/error/failure.dart';
import 'package:dio/dio.dart';

class ApiService {
 
  final _baseUrl = 'https://deal-dash-demo-4635067e93c3.herokuapp.com';
  final Dio _dio;

  ApiService(this._dio) {
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
  }) async {
    try {
      final response = await _dio.get(
        '$_baseUrl$endpoint',
        queryParameters: query,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
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

 Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      var response = await _dio.post(
        '$_baseUrl$endpoint',
        data: data,
        options: Options(
          headers: {
            'authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
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
import 'package:dio/dio.dart';

class ApiService {
//   static late Dio dio;
//   static init() {
//     dio = Dio(BaseOptions(
//         // baseUrl: UrlManager.baseUrl,
//         receiveDataWhenStatusError: true,
//         headers: {
//           'lang': 'en',
//           'Content-Type': 'application/json',
//         }));
//   }
//   static Future<Response?> getData(
//       {required String url, Map<String, dynamic>? query, String? token}) async {
//     return await dio.get(url,
//         queryParameters: query,
//         options: Options(headers: {'Authorization': token}));
//   }
//   static Future<Response?> postData(
//       {required String url,
//       Map<String, dynamic>? query,
//       required Map<String, dynamic> data,
//       String? token}) async {
//     return await dio.post(url,
//         queryParameters: query,
//         data: data,
//         options: Options(headers: {'Authorization': token}));
//   }
// }

  final _baseUrl = 'https://deal-dash-demo-4635067e93c3.herokuapp.com';
  final Dio _dio;

  ApiService(this._dio);
   Future<List<dynamic>>getData({
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
      return response.data;
    } catch (e) {
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
          },
        ),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
    //response.statusCode;
  }
}

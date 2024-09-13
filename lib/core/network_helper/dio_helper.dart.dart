import 'package:dio/dio.dart';

 class ApiServes {
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

final _baseUrl = 'https://dealdash-demo-a2ec8528b2f4.herokuapp.com/api/auth/';
  final Dio _dio;

  ApiServes(this._dio);
  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
   
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endpoint',
      data: data,
      options: Options(
        headers: {
          
          'authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
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
  }
}
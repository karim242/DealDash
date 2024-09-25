import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception {
  final ErrorResponse errorModel;

  ServerException( {required this.errorModel});
}

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorResponse.fromJson(e.response?.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorResponse.fromJson(e.response?.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorResponse.fromJson(e.response?.data));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorResponse.fromJson(e.response?.data));

    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorResponse.fromJson(e.response?.data));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorResponse.fromJson(e.response?.data));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorResponse.fromJson(e.response?.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(
              errorModel: ErrorResponse.fromJson(e.response?.data));
        case 401:
          throw ServerException(
              errorModel: ErrorResponse.fromJson(e.response?.data));
        case 403:
          throw ServerException(
              errorModel: ErrorResponse.fromJson(e.response?.data));
        case 404:
          throw ServerException(
              errorModel: ErrorResponse.fromJson(e.response?.data));
        case 500:
          throw ServerException(
              errorModel: ErrorResponse.fromJson(e.response?.data));
        case 502:
          throw ServerException(
              errorModel: ErrorResponse.fromJson(e.response?.data));
        case 503:
          throw ServerException(
              errorModel: ErrorResponse.fromJson(e.response?.data));
        default:
          throw ServerException(
              errorModel: ErrorResponse.fromJson(e.response?.data));
      }
  }
}

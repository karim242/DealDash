import 'package:dio/dio.dart';

import 'error_model.dart';

// abstract class Failure extends Equatable {
//   final String message;

//   const Failure(this.message);

//   @override
//   List<Object> get props => [message];
// }

// class ServerFailure extends Failure {
//   const ServerFailure(String message) : super(message);
// }

// class LocalFailure extends Failure {
//   const LocalFailure(String message) : super(message);
//}

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException( {required this.errorModel});
}

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data));

    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data));
        case 401:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data));
        case 403:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data));
        case 404:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data));
        case 500:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data));
        case 502:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data));
        case 503:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data));
        default:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data));
      }
  }
}

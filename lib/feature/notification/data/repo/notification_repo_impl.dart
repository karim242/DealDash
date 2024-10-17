
import 'package:dartz/dartz.dart';
import 'package:dealdash/core/error/error_model.dart';
import 'package:dealdash/core/network_helper/dio_helper.dart.dart';

import 'package:dealdash/feature/notification/data/model/notification_model.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import 'package:dealdash/feature/notification/data/repo/notification_repo.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';

class NotificationRepoImpl extends NotificationRepo {

  final ApiService apiService;

  NotificationRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<ErrorResponse, NotificationListResponse>> getNotificationsList() async {
    String? token = await SecureCacheHelper.getToken();
    try {
      final response = await apiService.getData(
        endpoint: '/api/v1/user/notifications/list-all?per_page=60',
        token: token,
      );

      if (response['success'] == true) {
        print("Heeeeend");
        print(response['data']);
        return Right(NotificationListResponse.fromJson(response));
      } else {
        return Left(ErrorResponse.fromJson(response));
      }
    } catch (e) {
      return Left(ErrorResponse(message: 'An error occurred: $e'));
    }
  }

  @override
  Future<Either<ErrorResponse, NotificationListResponse>> getUnreadNotifications() async {
    String? token = await SecureCacheHelper.getToken();

    try {
      final response = await apiService.getData(
        endpoint: '/api/v1/user/notifications/list-unread',
        query: {
          'per_page': 15,
        },
        token: token,
      );

      if (response['success'] == true && response['data'] != null) {
        print(response['data']);
        return Right(NotificationListResponse.fromJson(response));
      } else {
        return Left(ErrorResponse.fromJson(response));
      }
    } on DioException catch (e) {
      handelDioException(e);
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<ErrorResponse, NotificationListResponse>> markNotificationAsRead(String? notificationId) async {
    String? token =  await SecureCacheHelper.getToken();

    try {
      final response = await apiService.post(
        endpoint: '/api/v1/user/notifications/$notificationId/read',
        data: {},
        token: token,
      );

      if (response['success'] == true) {
        return Right(NotificationListResponse.fromJson(response));
      } else {
        return Left(ErrorResponse(
          message: response['message'],
          data: List<String>.from(response['errors'] ?? []),
        ));
      }
    } on DioException catch (e) {
      handelDioException(e);
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<ErrorResponse, NotificationListResponse>> markNotificationAsUnread(String? notificationId) async {
    String? token =  await SecureCacheHelper.getToken();

    try {
      final response = await apiService.post(
        endpoint: '/api/v1/user/notifications/$notificationId/unread',
        data: {},
        token: token,
      );

      if (response['success'] == true) {
        return Right(NotificationListResponse.fromJson(response));
      } else {
        return Left(ErrorResponse(
          message: response['message'],
          data: List<String>.from(response['errors'] ?? []),
        ));
      }
    } on DioException catch (e) {
      handelDioException(e);
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<ErrorResponse, NotificationListResponse>> markAllNotificationsAsRead() async {
    String? token =  await SecureCacheHelper.getToken();

    try {
      final response = await apiService.post(
        endpoint: '/api/v1/user/notifications/read-all',
        data: {},
        token: token,
      );

      if (response['success'] == true) {
        return Right(NotificationListResponse.fromJson(response));
      } else {
        return Left(ErrorResponse(
          message: response['message'],
          data: List<String>.from(response['errors'] ?? []),
        ));
      }
    } on DioException catch (e) {
      handelDioException(e);
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<ErrorResponse, NotificationListResponse>> markAllNotificationsAsUnread() async {
    String? token =  await SecureCacheHelper.getToken();

    try {
      final response = await apiService.post(
        endpoint: '/api/v1/user/notifications/unread-all',
        data: {},
        token: token,
      );

      if (response['success'] == true) {
        return Right(NotificationListResponse.fromJson(response));
      } else {
        return Left(ErrorResponse(
          message: response['message'],
          data: List<String>.from(response['errors'] ?? []),
        ));
      }
    } on DioException catch (e) {
      handelDioException(e);
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    }
  }

}
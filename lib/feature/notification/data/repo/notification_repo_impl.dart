
import 'package:dartz/dartz.dart';

import 'package:dealdash/core/error/error_model.dart';
import 'package:dealdash/core/network_helper/dio_helper.dart.dart';

import 'package:dealdash/feature/notification/data/model/notification_model.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import 'package:dealdash/feature/notification/data/repo/notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {

  final ApiService apiService;

  NotificationRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<ErrorResponse, NotificationListResponse>> getNotificationsList() async {
    String? token = CacheHelper.getToken();
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

}
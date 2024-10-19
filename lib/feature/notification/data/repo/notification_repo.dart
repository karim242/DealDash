
import 'package:dartz/dartz.dart';
import 'package:dealdash/core/error/error_model.dart';
import 'package:dealdash/feature/notification/data/model/notification_model.dart';


abstract class NotificationRepo {
  Future<Either<ErrorResponse, NotificationListResponse>> getNotificationsList();
  Future<Either<ErrorResponse, NotificationListResponse>> getUnreadNotifications();
  Future<Either<ErrorResponse, NotificationReadResponse>> markNotificationAsRead(String? notificationId);
  Future<Either<ErrorResponse, NotificationReadResponse>> markNotificationAsUnread(String? notificationId);
  Future<Either<ErrorResponse, NotificationReadResponse>> markAllNotificationsAsRead();
  Future<Either<ErrorResponse, NotificationReadResponse>> markAllNotificationsAsUnread();
}
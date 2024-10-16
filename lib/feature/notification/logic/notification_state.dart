import '../data/model/notification_model.dart';

abstract class NotificationState {}

final class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final NotificationListResponse response;

  NotificationSuccess({required this.response});
}

class NotificationFailure extends NotificationState {
  final String errorMessage;
  NotificationFailure({required this.errorMessage});
}
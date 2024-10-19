import 'package:bloc/bloc.dart';
import 'package:dealdash/feature/notification/data/model/notification_model.dart';
import 'package:dealdash/feature/notification/data/repo/notification_repo_impl.dart';
import 'notification_state.dart';



class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepoImpl notificationRepo;
  NotificationListResponse? notificationListResponse;

  NotificationCubit({required this.notificationRepo}) : super(NotificationInitial());

  Future<void> getAllNotifications() async {
    emit(NotificationLoading());

    final result = await notificationRepo.getNotificationsList();

    result.fold(
          (error) {
        emit(NotificationFailure(errorMessage: error.message ?? 'Unknown error'));
      },
          (response) {
        notificationListResponse = response; // Save the favorite stores response
        emit(NotificationSuccess(response: response));
      },
    );
  }

  Future<void> setNotificationAsRead(String? id) async {
    emit(NotificationLoading());

    final result = await notificationRepo.markNotificationAsRead(id);
    result.fold(
      (error) {
        emit(NotificationFailure(errorMessage: error.message ?? 'unknown error'));
      },
      (response) {
        // notificationListResponse = response;
        // emit(NotificationSuccess(response: response));
        print(response.message);
      }
    );
  }
}
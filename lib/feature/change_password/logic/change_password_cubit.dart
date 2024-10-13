
import 'package:dealdash/feature/change_password/data/model/password_model.dart';
import 'package:dealdash/feature/change_password/data/repo/change_password_repo.dart';
import 'package:dealdash/feature/change_password/logic/change_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<PasswordState> {
  final ChangePasswordRepo repository;

  ChangePasswordCubit(this.repository) : super(PasswordInitial());

  Future<void> changePassword(PasswordModel password) async {
    emit(PasswordLoading());
    final result = await repository.changePassword(password);
    result.fold(
      (error) => emit(PasswordFailure(error)),
      (response) => emit(PasswordSuccess(response)),
    );
  }
}
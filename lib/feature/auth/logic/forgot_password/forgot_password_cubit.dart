//cubit for forget password

import 'package:dealdash/feature/auth/data/repo/auth_repo.dart';
import 'package:dealdash/feature/auth/logic/forgot_password/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository authRepository;

  ForgotPasswordCubit(this.authRepository) : super(ForgotPasswordInitial());

  Future<void> forgetPassword({required String email}) async {
    try {
      emit(ForgotPasswordLoading());

      final result = await authRepository.forgetPassword(email: email);

      result.fold(
        (failure) => emit(ForgotPasswordError(message: failure)),
        (message) => emit(ForgotPasswordLoaded(message: message)),
      );
    } catch (e) {
      emit(const ForgotPasswordError(message: 'Something went wrong'));
    }
  }
}
import 'package:dealdash/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository) : super(LoginInitial());
  final AuthRepository authRepository;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final response = await authRepository.signIn(email: email, password: password);

      response.fold(
        (failure) => emit(LoginError(failure.errorModel.message)),
        (success) {
         
          emit(LoginSuccess());
        },
      );
    } catch (e) {
      emit(LoginError('An unexpected error occurred'));
    }
  }
}
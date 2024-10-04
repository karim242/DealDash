import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/auth_repo_impl.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepository) : super(SignupInitial());
  final AuthRepositoryImpl authRepository;

  Future<void> signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String userName,
  }) async {
    emit(SignupLoading());
    try {
      final response = await authRepository.signUp(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        name: userName,
        phone: phone,
      );

      response.fold(
        (failure) => emit(SignupError(failure.errorModel.message)),
        (success) {
         // print(success.user.name);
         

          emit(SignupSuccess());
        },
      );
    } catch (e) {
      emit(SignupError('An unexpected error occurred'));
    }
  }
}

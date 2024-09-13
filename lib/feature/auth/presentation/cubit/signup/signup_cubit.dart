import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache_helper/cache_helper.dart';
import '../../../data/repo/auth_repo_impl.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepoImpel) : super(SignupInitial());
  AuthRepoImplementation authRepoImpel;

  Future<void> signUp({
    required String email,
    required String password,
    required String phone,
    required String userName,
  }) async {
    emit(SignupLoding());

    authRepoImpel
        .signUp(email: email, password: password, name: userName, phone: phone)
        .then((response) {
      response.fold(
        (failure) => {
       //   throw(failure.message),
          emit(SignupError(failure.message))},
        (success) => {
          print(success.user.name),
          //CacheHelper.saveData(key: 'token', value: success.token),
        //  CacheHelper.saveData(key: 'userName', value: success.user.name),
          //CacheHelper.saveData(key: 'email', value: success.user.email),
          emit(SignupSuccess())
        },
      );
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/auth_repo_impl.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepoImpel) : super(LoginInitial());
  AuthRepoImplementation authRepoImpel;


Future<void> login({required String email, required String password}) async {
    emit(LoginLoding());
    authRepoImpel
        .signIn(email: email, password: password)
        .then((resopnse) {
      resopnse.fold(
        (failure) => emit(LoginError(failure.message)),
        (success) {
          print(success.user.id.toString());
        //  CacheHelper.saveData(key: 'token', value: success.token);
        //  CacheHelper.saveData(key: 'email', value: success.user.email);
        //  CacheHelper.saveData(key: 'userName', value: success.user.name);
        //  CacheHelper.saveData(key: 'name', value: success.user!.name);
          emit(LoginSuccess());
        },
      );
    });
  }

}
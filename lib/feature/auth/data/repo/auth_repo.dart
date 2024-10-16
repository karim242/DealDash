import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/user_model.dart';

abstract class AuthRepository {
  Future<Either<ServerException, AuthResponse>> signUp({
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
    required String name,
  });

  Future<Either<ServerException, AuthResponse>> signIn({
    required String email,
    required String password,
  });

  //forget password 
  Future<Either<String, String>> forgetPassword({
    required String email,
  });

  // log out
  Future <void> logOut();
}

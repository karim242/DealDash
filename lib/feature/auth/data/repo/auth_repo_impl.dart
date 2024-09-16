import 'package:dartz/dartz.dart';
import 'package:dealdash/core/error/failure.dart';
import 'package:dealdash/feature/auth/data/model/user_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network_helper/dio_helper.dart.dart';
import 'auth_repo.dart';

class AuthRepoImplementation implements AuthRepository {
  final ApiService apiServes;
  AuthRepoImplementation({required this.apiServes});

  @override
  Future<Either<Failure, UserModel>> signIn(
      {required String email, required String password}) async {
    try {
      final response = await apiServes.post(endpoint: 'auth/login', data: {
        'email': email,
        'password': password,
      });
      if (response.isNotEmpty) {
        return right(UserModel.fromJson(response));
      } else {
        return left(ServerFailure(response['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure(failure.toString()));
      }
      return left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    try {
      final response = await apiServes.post(
        endpoint: 'auth/register',
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
        },
      );

      if (response.isNotEmpty) {
        return right(UserModel.fromJson(response));
      } else {
        return left(ServerFailure(response['message']));
      }
    } catch (failure) {
      if (failure is DioError) {
        return left(ServerFailure(failure.toString()));
      }
      return left(ServerFailure(failure.toString()));
    }
  }
  
 
}

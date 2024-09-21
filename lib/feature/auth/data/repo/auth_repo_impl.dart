import 'package:dartz/dartz.dart';
import 'package:dealdash/core/error/failure.dart';
import 'package:dealdash/feature/auth/data/model/user_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/network_helper/dio_helper.dart.dart';
import 'auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiServes;
  String? token;
  AuthRepositoryImpl({required this.apiServes});

  @override
  Future<Either<ServerException, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiServes.post(
       endpoint:  '/api/auth/signin',
        data: {
          'email': email,
          'password': password,
        },
      );

      final userModel = UserModel.fromJson(response);
      CacheHelper.saveToken(value: userModel.token);
      return Right(userModel);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      handelDioException(e);
      return Left(ServerException(errorModel: ErrorModel.fromJson(e.response?.data)));
    } catch (e) {
      // Handle any other type of exception
      return Left(ServerException(errorModel: ErrorModel(message: 'Unknown error occurred')));
    }
  }


  Future<Either<ServerException, UserModel>> signUp({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      final response = await apiServes.post(
        endpoint: '/api/auth/register',
        data: {
          'email': email,
          'password': password,
          'phone': phone,
          'name': name,
        },
      );
      print(response);
  
      final userModel = UserModel.fromJson(response);
      CacheHelper.saveToken(value: userModel.token);
      return Right(userModel);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      handelDioException(e);
      return Left(ServerException(errorModel: ErrorModel.fromJson(e.response?.data)));
    } catch (e) {
      // Handle any other type of exception
      return Left(ServerException(errorModel: ErrorModel(message: 'Unknown error occurred')));
    }
  }
  
 
}

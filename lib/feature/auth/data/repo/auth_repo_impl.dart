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
  Future<Either<ServerException, AuthResponse>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiServes.post(
       endpoint:  '/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final authResponse = AuthResponse.fromJson(response);
      CacheHelper.saveToken(value: authResponse.data.token);
      CacheHelper.saveString( key: 'user_name',value: authResponse.data.user.name,);
      CacheHelper.saveString( key: 'user_email',value: authResponse.data.user.email,);
      CacheHelper.saveString( key: 'user_phone',value: authResponse.data.user.phone,);
      return Right(authResponse);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      handelDioException(e);
      return Left(ServerException(errorModel: ErrorResponse.fromJson(e.response?.data)));
    } 
  }


  Future<Either<ServerException, AuthResponse>> signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String name,
  }) async {
    try {
      final response = await apiServes.post(
        endpoint: '/api/auth/register',
        data: {
          'email': email,
          'password': password,
          'password_confirmation':confirmPassword,
          'phone': phone,
          'name': name,
        },
      );
      print(response);
  
      final authResponse = AuthResponse.fromJson(response);
      
      CacheHelper.saveToken(value: authResponse.data.token);
      CacheHelper.saveString( key: 'user_name',value: authResponse.data.user.name,);
      CacheHelper.saveString( key: 'user_email',value: authResponse.data.user.email,);
      CacheHelper.saveString( key: 'user_phone',value: authResponse.data.user.phone,);

      return Right(authResponse);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      handelDioException(e);
      return Left(ServerException(errorModel: ErrorResponse.fromJson(e.response?.data)));
    } 
  }
  
 
}

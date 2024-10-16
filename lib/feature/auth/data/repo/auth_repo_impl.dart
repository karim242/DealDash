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

        fcmToken: CacheHelper.getFCMToken(),
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
    
  
      final authResponse = AuthResponse.fromJson(response);
        print("response $authResponse.");
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
  
  @override
  Future<Either<String, String>> forgetPassword({required String email}) async{

     try {
      final response = await apiServes.post(
        endpoint: '/api/auth/forgot-password',
        data: {
          'email': email,
        },
      );
      print(response);
      return const Right('Email has been sent to your email address');
    } on DioException catch (e) {
      handelDioException(e);
      return const Left('Email address is not true');
    }

   
  }
  
  @override
  Future<void> logOut() async{

     try {
      final response = await apiServes.post(
        endpoint: '/api/auth/logout',
        data: {},
        token: CacheHelper.getToken(),
        
      );
      
    } on DioException catch (e) {
      rethrow;
    }
  }
  
  
 
}

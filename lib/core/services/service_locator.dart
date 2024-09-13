
import 'package:dealdash/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/data/repo/auth_repo_impl.dart';
import '../../feature/auth/presentation/cubit/signup/signup_cubit.dart';
import '../network_helper/dio_helper.dart.dart';


final sl = GetIt.instance;

class ServiceLocator{

  void init() {
    //ApiServes
   sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<ApiServes>(() => ApiServes(sl.get<Dio>()));



    sl.registerLazySingleton<AuthRepoImplementation>(
        () => AuthRepoImplementation(apiServes: sl.get<ApiServes>()));
    
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl<AuthRepoImplementation>()));
        sl.registerFactory<SignupCubit>(() => SignupCubit(sl<AuthRepoImplementation>()));


   
  }
}
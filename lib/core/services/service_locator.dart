import 'package:dealdash/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/data/repo/auth_repo_impl.dart';
import '../../feature/auth/presentation/cubit/signup/signup_cubit.dart';
import '../../feature/location/data/repo/places/places_repo.dart';
import '../../feature/location/data/repo/places/places_repo_impl.dart';
import '../../feature/location/data/repo/store/store_repo.dart';
import '../../feature/location/data/repo/store/store_repo_impl.dart';
import '../../feature/location/presentation/cubit/places_cubit/places_cubit.dart';
import '../../feature/location/presentation/cubit/store_cubit/store_cubit.dart';
import '../network_helper/dio_helper.dart.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //ApiServes
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<ApiService>(() => ApiService(sl.get<Dio>()));

    sl.registerLazySingleton<AuthRepositoryImpl>(
        () => AuthRepositoryImpl(apiServes: sl.get<ApiService>()));

    sl.registerFactory<LoginCubit>(
        () => LoginCubit(sl<AuthRepositoryImpl>()));
    sl.registerFactory<SignupCubit>(
        () => SignupCubit(sl<AuthRepositoryImpl>()));

    // Register Repository
    sl.registerLazySingleton<StoreRepository>(() => StoreRepositoryImpl(sl()));

    // Register Cubit
    sl.registerFactory(() => StoreCubit(sl()));

// تسجيل PlacesCubit
    sl.registerLazySingleton<PlacesRepository>(
        () => PlacesRepositoryImpl(dio: sl()));
    sl.registerFactory<PlacesCubit>(() => PlacesCubit(sl<PlacesRepository>()));
  }
}

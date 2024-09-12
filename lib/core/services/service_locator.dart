
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

class ServiceLocator{

 void init(){
      //use cases
      //   sl.registerLazySingleton(() => GetLoginResponse(sl()));
      //   sl.registerLazySingleton(() => GetSignUpResponse(sl()));
     


      //   //repository
      //   sl.registerLazySingleton<BaseLoginRepository>(() => LogInRepository(sl()));
      //   sl.registerLazySingleton<BaseSignupRepository>(() => SignUpRepository(sl()));
      // //data source
      //   sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());
      //   sl.registerLazySingleton<BaseSignUpDataSource>(() => SignUpDataSource());
       


  }
}
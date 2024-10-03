import 'package:dealdash/core/services/service_locator.dart';
import 'package:dealdash/feature/location/presentation/cubit/places_cubit/places_cubit.dart';
import 'package:dealdash/feature/settings/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../core/resources/routes_manger/routes_manager.dart';
import 'core/check_connect_internet/cubit/connect_internet_cubit.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, index) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<PlacesCubit>(),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(), 
                      ),
          BlocProvider(
            create: (context) => ConnectInternetCubit()..checkConnection(),
                      ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeMode, 
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}

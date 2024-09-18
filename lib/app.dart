import 'package:flutter/material.dart';

import '../core/resources/routes_manger/routes_manager.dart';
import 'core/resources/style_manger/style_manager.dart';
import 'feature/home/presentation/view/home_view.dart';
import 'feature/home/presentation/view/root_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  // return MaterialApp(
  //   theme: AppTheme.theme,
  //     debugShowCheckedModeBanner: false,
  //   home: RootView(),
  // );
  }
}

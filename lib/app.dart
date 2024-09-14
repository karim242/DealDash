import 'package:flutter/material.dart';

import '../core/resources/routes_manger/routes_manager.dart';
import 'feature/home/presentation/view/home_view.dart';
import 'feature/home/presentation/view/root_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerConfig: AppRouter.router,
    //
    // );
  return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: RootView(),
  );
  }
}

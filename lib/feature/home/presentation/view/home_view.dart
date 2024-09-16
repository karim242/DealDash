import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routes_manger/routes_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
     // child: IconButton(
       //   onPressed: () {
        //    GoRouter.of(context).push(Routes.aboutStoreRoute,);
        //  }, icon: const Icon(Icons.arrow_forward_ios)),
       child: Text(
         'Home Page',
       style: TextStyle(fontSize: 24),
    ),
    );
  }
}

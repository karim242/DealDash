import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
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

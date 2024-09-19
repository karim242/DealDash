import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routes_manger/routes_manager.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
Future.delayed(const Duration(seconds: 4), () {
      context.go(Routes.onBoardingRoute,);
    });
     super.initState();
  }

  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: ColorManager.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: AnimatedCrossFade(
            firstChild: const SizedBox(),
            secondChild: SizedBox(
              child: Image.asset("assets/images/splash.png", 
                
                 
              ),
            ),
            crossFadeState: CrossFadeState.showSecond,
            duration: const Duration(seconds: 1),
          )),
        ],
      ),
    );
  }
}
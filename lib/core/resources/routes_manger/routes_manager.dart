
import 'package:dealdash/feature/onbording_splash/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../feature/onbording_splash/presentation/views/splash_view.dart';
import '../../../feature/onbording_splash/presentation/views/welcome_view.dart';


class Routes{
  static const String splashRoute="/";
  static const String onBoardingRoute="/onBoardingView";
  static const String welcomeRoute="/welcome_view";
  static const String loginRoute="/login_view";

  static const String forgetPasswordRoute="/forgetpassword_view";
  static const String signUpRoute="/signup_view";
  static const String mainLayout='/main_layout';
}

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: Routes.splashRoute,
      builder: (context, state) => const SplashView(),
    ),
     GoRoute(
      path: Routes.onBoardingRoute,
      builder: (context, state) => const OnBoardingView(),
      ),
    GoRoute(
      path: Routes.welcomeRoute,
      builder: (context, state) => const WelcomeView(),
      ),
    
    // GoRoute(
    //   path: Routes.signUpRoute,
    //    builder: (context, state) =>  SignUpView(),
  
    // ),
    // GoRoute(
    //   path: Routes.forgetPasswordRoute,
    //   builder: (context, state) => const ForgetPasswordView(),
    // ),
  ]);
}
import 'package:dealdash/core/services/service_locator.dart';
import 'package:dealdash/feature/about_stores/presentation/view/about_stores_view.dart';
import 'package:dealdash/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dealdash/feature/auth/presentation/views/signup_view.dart';
import 'package:dealdash/feature/home/presentation/view/root_view.dart';
import 'package:dealdash/feature/onbording_splash/presentation/view/onboarding_view.dart';
import 'package:dealdash/feature/settings/presentation/view/settings_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import '../../../feature/location/data/model/store_model.dart';
import '../../../feature/auth/presentation/cubit/signup/signup_cubit.dart';
import '../../../feature/auth/presentation/views/forget_password.dart';
import '../../../feature/auth/presentation/views/login_view.dart';
import '../../../feature/onbording_splash/presentation/view/splash_view.dart';
import '../../../feature/onbording_splash/presentation/view/welcome_view.dart';
class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoardingView";
  static const String welcomeRoute = "/welcome_view";
  static const String loginRoute = "/LoginView";

  static const String forgetPasswordRoute = "/forgetPassword_view";
  static const String signUpRoute = "/signup_view";
  static const String rootViewRoute = '/rootView';
  static const String locationRoute = '/location_view';

  static const String aboutStoreRoute = '/aboutStoreView';
  static const String settingsRoute = '/settingsView';
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

    GoRoute(
      path: Routes.loginRoute,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<LoginCubit>(),
        child: LoginView(),
      ),
    ),

    GoRoute(
      path: Routes.signUpRoute,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<SignupCubit>(),
        child: SignUpView(),
      ),
    ),
    GoRoute(
      path: Routes.forgetPasswordRoute,
      builder: (context, state) =>  ForgetPassword(),
    ),
    GoRoute(
      path: Routes.rootViewRoute,
      builder: (context, state) =>  const RootView(),
    ),
    GoRoute(
      path: Routes.aboutStoreRoute,
      builder: (context, state) {
        final store = state.extra as Store;
         return AboutStoresView(store: store);
      }
    ),
    GoRoute(
      path: Routes.settingsRoute,
      builder: (context, state) =>  const SettingsView(),
    ),
  ]);
}

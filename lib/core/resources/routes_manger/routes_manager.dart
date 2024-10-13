import 'package:dealdash/core/services/service_locator.dart';
import 'package:dealdash/core/widget/product_details.dart';
import 'package:dealdash/core/widget/product_static_details.dart';
import 'package:dealdash/feature/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:dealdash/feature/change_password/logic/change_password_cubit.dart';
import 'package:dealdash/feature/favourite/data/model/favourite_model.dart';
import 'package:dealdash/feature/favourite/presentation/view/store_details_view.dart';
import 'package:dealdash/feature/home/presentation/control/product_model.dart';
import 'package:dealdash/feature/home/presentation/widget/item_of_list_bottom_widget.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/view/about_stores_view.dart';
import 'package:dealdash/feature/about_us/presentation/view/about_us_view.dart';
import 'package:dealdash/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dealdash/feature/auth/presentation/views/signup_view.dart';
import 'package:dealdash/feature/change_password/presentation/view/change_password_view.dart';
import 'package:dealdash/feature/home/presentation/view/root_view.dart';
import 'package:dealdash/feature/onbording_splash/presentation/view/onboarding_view.dart';
import 'package:dealdash/feature/privacy_and_policy/presentation/view/privacy_and_policy_view.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:dealdash/feature/search/logic/search_cubit.dart';
import 'package:dealdash/feature/search/presentation/views/search_view.dart';
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
  static const String privacyAndPolicyRoute = '/privacyAndPolicyView';
  static const String aboutUsRoute = '/aboutUsView';
  static const String favouriteStore = '/favouriteStore';
  static const String changePasswordRoute = '/changePasswordView';

  static const String searchRoute = '/searchingView';

  static const String productDetails = '/productDetails';
  static const String productStaticDetails = '/productStaticDetails';

  static const String offerListInCategory = '/offerListInCategory';
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
        builder: (context, state) => BlocProvider(
              create: (context) => sl<ForgotPasswordCubit>(),
              child: ForgetPassword(),
            )),
    GoRoute(
      path: Routes.rootViewRoute,
      builder: (context, state) => const RootView(),
    ),
    GoRoute(
        path: Routes.aboutStoreRoute,
        builder: (context, state) {
          final store = state.extra as Store;
          return AboutStoresView(store: store);
        }),
    GoRoute(
      path: Routes.settingsRoute,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: Routes.privacyAndPolicyRoute,
      builder: (context, state) => const PrivacyAndPolicyView(),
    ),
    GoRoute(
      path: Routes.aboutUsRoute,
      builder: (context, state) => const AboutUsView(),
    ),
    GoRoute(
        path: Routes.favouriteStore,
        builder: (context, state) {
          final favouriteStore = state.extra as FavoriteStore;
          return StoreFavouriteDetails(
            store: favouriteStore,
          );
        }),
    GoRoute(
      path: Routes.changePasswordRoute,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<ChangePasswordCubit>(),
        child: ChangePasswordView(),
      ),
    ),
    GoRoute(
        path: Routes.searchRoute,
        builder: (context, state) {
          final String query = state.extra as String;
          return BlocProvider(
            create: (context) => sl<SearchCubit>()..searchForOffer(query),
            child: const SearchView(),
          );
        }),
    GoRoute(
        path: Routes.productDetails,
        builder: (context, state) {
          final store = state.extra as Offer;
          return ProductDetails(
            product: store,
          );
        }),
    GoRoute(
        path: Routes.productStaticDetails,
        builder: (context, state) {
          final productModel = state.extra as ProductModel;

          return ProductStaticDetails(
            product: productModel,
          );
        }),
    GoRoute(
        path: Routes.offerListInCategory,
        builder: (context, state) {
          final offerList = state.extra as List<Offer>?;
          return OffersListInCategory(
            offerList: offerList,
          );
        }),
  ]);
}

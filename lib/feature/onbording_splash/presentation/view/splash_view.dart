import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/check_connect_internet/cubit/connect_internet_cubit.dart';
import '../../../../core/check_connect_internet/cubit/connect_internet_state.dart';
import '../../../../core/resources/routes_manger/routes_manager.dart';
import '../../../../core/widget/ui_not_connectinternet_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: BlocBuilder<ConnectInternetCubit, ConnectInternetState>(
          builder: (context, state) {
            if (state is NotConnectedState) {
              return const UINotConnectInterNetWidget();
            }
            if (state is ConnectedState) {
              Future.delayed(const Duration(seconds: 3), () {
                if (context.mounted) {
                  context.go(
                    Routes.onBoardingRoute,
                  );
                }
              });

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedCrossFade(
                    firstChild: const SizedBox(),
                    secondChild: Image.asset(
                      "assets/images/splash.png",
                    ),
                    crossFadeState: CrossFadeState.showSecond,
                    duration: const Duration(seconds: 1),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

}


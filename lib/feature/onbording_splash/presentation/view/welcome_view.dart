import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/check_connect_internet/cubit/connect_internet_cubit.dart';
import '../../../../core/check_connect_internet/cubit/connect_internet_state.dart';
import '../../../../core/resources/routes_manger/routes_manager.dart';
import '../../../../core/widget/ui_not_connectinternet_widget.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  void initState() {
    super.initState();
    // checkLoginStatus(context);
  }

  void checkLoginStatus(BuildContext context) async{
    String? token = await SecureCacheHelper.getToken();
    print(token);
    if (token != null) {
      context.go(Routes.rootViewRoute);
    } else {
      context.go(Routes.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: BlocBuilder<ConnectInternetCubit, ConnectInternetState>(
          builder: (context, state) {
            if (state is NotConnectedState) {
              return const UINotConnectInterNetWidget();
            }
            return Column(
              children: [
                // Top Image
                // const SizedBox(height: 50),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/welcome_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Main Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to DealDash',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: ColorManager.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          'The fair and honest bidding site.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: ColorManager.gray,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Continue with Google Button
                        ElevatedButton(
                          onPressed: () {
                            checkLoginStatus(context);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: ColorManager.red,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text('Log in'),
                        ),
                        const SizedBox(height: 15),

                        // Continue with Facebook Button
                        ElevatedButton(
                          onPressed: () {
                            GoRouter.of(context).push(Routes.signUpRoute);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.grey.shade200,
                            backgroundColor: ColorManager.yellow,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

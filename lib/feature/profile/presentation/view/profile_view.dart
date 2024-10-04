import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/resources/routes_manger/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/check_connect_internet/cubit/connect_internet_cubit.dart';
import '../../../../core/check_connect_internet/cubit/connect_internet_state.dart';
import '../../../../core/widget/ui_not_connectinternet_widget.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final String userName = CacheHelper.getString(key: "user_name")!;
  final String userEmail = CacheHelper.getString(key: "user_email")!;
  final String userPhone = CacheHelper.getString(key: "user_phone")!;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectInternetCubit, ConnectInternetState>(
      builder: (context, state) {
        if (state is NotConnectedState) {
          return const UINotConnectInterNetWidget();
        }

<<<<<<< HEAD
              // Profile Picture and Info
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orange.shade100,
                child: const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(
                      'assets/images/h_anonymous.png'), // Replace with user image
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      // backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(Icons.edit, size: 15, color: Colors.orange),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                userPhone,
                style: const TextStyle(
                  fontSize: 14,
                  //  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                userEmail,
                style: const TextStyle(
                  fontSize: 14,
                  // color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // Menu Items
              _buildMenuItem(
                icon: Icons.lock_outline,
                title: "Privacy Policy",
                onTap: () {
                  GoRouter.of(context).push(Routes.privacyAndPolicyRoute);
                },
              ),
              _buildMenuItem(
                icon: Icons.info_outline,
                title: 'About',
                onTap: () {
                  GoRouter.of(context).push(Routes.aboutUsRoute);
                },
              ),
              _buildMenuItem(
                icon: Icons.help_outline,
                title: 'Help',
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.settings_outlined,
                title: 'Settings',
                onTap: () {
                  GoRouter.of(context).push(Routes.settingsRoute);
                },
              ),
              _buildMenuItem(
                icon: Icons.logout_outlined,
                title: 'Log out',
                onTap: () async {
                  GoRouter.of(context).go(Routes.welcomeRoute);
                  await CacheHelper.removeToken();
                },
              ),
=======
        return Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Profile',
              style: TextStyle(
                // color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  // Profile Picture and Info
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.orange.shade100,
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(
                          'assets/images/h_anonymous.png'),
                      // Replace with user image
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          // backgroundColor: Colors.white,
                          radius: 12,
                          child: Icon(
                              Icons.edit, size: 15, color: Colors.orange),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      // color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    userPhone,
                    style: const TextStyle(
                      fontSize: 14,
                      //  color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userEmail,
                    style: const TextStyle(
                      fontSize: 14,
                      // color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Menu Items
                  _buildMenuItem(
                    icon: Icons.lock_outline,
                    title: "Privacy Policy",
                    onTap: () {
                      GoRouter.of(context).push(Routes.privacyAndPolicyRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    onTap: () {
                      GoRouter.of(context).push(Routes.aboutUsRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'Help',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {
                      GoRouter.of(context).push(Routes.settingsRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.logout_outlined,
                    title: 'Log out',
                    onTap: () {},
                  ),
>>>>>>> d638833e13bba387e2c3987a829a45d1d20f2b08

                  // const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem({required IconData icon,
    required String title,
    required final VoidCallback onTap}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ColorManager.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: ColorManager.red, size: 24),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      //color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const Icon(Icons.chevron_right, color: Colors.grey, size: 24),
            ],
          ),
        ));
  }
}

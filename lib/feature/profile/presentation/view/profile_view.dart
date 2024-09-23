import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen();
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
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
                      'assets/images/h_anonymous.png'), // Replace with user image
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(Icons.edit, size: 15, color: Colors.orange),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hend',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '020 0100000000',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'hend@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
          
              // Menu Items
              _buildMenuItem(Icons.lock_outline, 'Privacy Policy'),
              _buildMenuItem(Icons.info_outline, 'About'),
              _buildMenuItem(Icons.help_outline, 'Help'),
              _buildMenuItem(Icons.settings_outlined, 'Settings'),
              _buildMenuItem(Icons.logout_outlined, 'Log out'),
          
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 24),
        ],
      ),
    );
  }
}

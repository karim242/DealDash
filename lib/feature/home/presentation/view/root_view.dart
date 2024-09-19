import 'package:dealdash/feature/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../favoruite/presentation/view/favoruite_view.dart';
import '../../../location/presentation/view/location_view.dart';
import '../../../notification/presentation/view/notification_view.dart';
import '../../../profile/presentation/view/profile_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _selectedIndex = 0;

  // الصفحات التي سيتم عرضها بناءً على الفهرس
  final List<Widget> _pages = [
    const HomeView(),
    const FavoriteView(),
    const Placeholder(), // صفحة Placeholder مكان الزر العائم (لن تستخدم)
    NotificationView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // تغيير الصفحة بناءً على الفهرس المختار
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Colors.grey.shade300, width: 1.5), // الحد السفلي فقط
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.yellow,
          unselectedItemColor: ColorManager.primary,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(null), // تركه فارغًا لزر الـ FloatingActionButton
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60, // حجم أكبر للزر العائم
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ), //
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: Icon(
            Icons.location_on,
            size: 30,
            color: ColorManager.primary,
          ),
          backgroundColor: ColorManager.red,
        ),
      ),
    );
  }
}

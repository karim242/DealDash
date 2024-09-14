import 'package:dealdash/feature/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/routes_manger/routes_manager.dart';
import '../../../../core/services/location_service.dart';
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
  LocationData? currentLocation;
  LocationService _locationService = LocationService();
  
  int _selectedIndex = 0;

  // الصفحات التي سيتم عرضها بناءً على الفهرس
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // يجب تعريف _pages هنا بعد جلب الموقع
    _pages = [
      const HomeView(),
      const FavoriteView(),
      currentLocation != null ? LocationView(currentLocation: currentLocation!) : Container(),
      const NotificationView(),
      const ProfileView(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1.5), // الحد السفلي فقط
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
        ),
        child: FloatingActionButton(
          onPressed: () async {
            // الحصول على الموقع
            LocationData? locationData = await _locationService.requestLocationPermission();
            if (locationData != null) {
              setState(() {
                currentLocation = locationData;
                _pages[2] = LocationView(currentLocation: currentLocation!); // تحديث صفحة الموقع
                _selectedIndex = 2; // الانتقال إلى صفحة الموقع
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Failed to get location")),
              );
            }
          },
          child: Icon(Icons.location_on, size: 30, color: ColorManager.primary),
          backgroundColor: ColorManager.red,
        ),
      ),
    );
  }
}
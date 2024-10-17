// import 'package:dealdash/feature/home/presentation/control/category/category_cubit.dart';
// import 'package:dealdash/feature/home/presentation/view/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:location/location.dart';

// import '../../../../core/resources/color_manger/color_manager.dart';
// import '../../../../core/services/location_service.dart';
// import '../../../../core/services/service_locator.dart';
// import '../../../favoruite/presentation/view/favoruite_view.dart';
// import '../../../location/presentation/cubit/store_cubit/store_cubit.dart';
// import '../../../location/presentation/view/location_view.dart';
// import '../../../notification/presentation/view/notification_view.dart';
// import '../../../profile/presentation/view/profile_view.dart';

// class RootView extends StatefulWidget {
//   const RootView({super.key});

//   @override
//   State<RootView> createState() => _RootViewState();
// }

// class _RootViewState extends State<RootView> {
//   LocationData? currentLocation;
//   final LocationService _locationService = LocationService();

//   int _selectedIndex = 0;
//   late List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       BlocProvider(
//         create: (context) => sl<CategoryCubit>()..fetchCategories(),
//         child: const HomeView(),
//       ),
//       const FavoriteView(),
//       currentLocation != null
//           ? LocationView(currentLocation: currentLocation!)
//           : Container(),
//       const NotificationView(),
//       ProfileView(),
//     ];
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           border: Border(
//             top: BorderSide(
//                 color: Colors.grey.shade300, width: 1.5), // الحد السفلي فقط
//           ),
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: ColorManager.yellow,
//           unselectedItemColor: ColorManager.primary,
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Favorite',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(null), // تركه فارغًا لزر الـ FloatingActionButton
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications),
//               label: 'Notification',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Container(
//         height: 60,
//         width: 60,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: FloatingActionButton(
//           onPressed: () async {
//             LocationData? locationData =
//                 await _locationService.requestLocationPermission();
//             if (locationData != null) {
//               setState(
//                 () {
//                   currentLocation = locationData;
//                   _pages[2] = BlocProvider(
//                     create: (context) => sl<StoreCubit>(),
//                     child: LocationView(currentLocation: currentLocation!),
//                   );
//                   _selectedIndex = 2;
//                 },
//               );
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Failed to get location")),
//               );
//             }
//           },
//           backgroundColor: ColorManager.red,
//           child: Icon(Icons.location_on, size: 30, color: ColorManager.primary),
//         ),
//       ),
//     );
//   }
// }

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dealdash/feature/auth/logic/logout/logout_cubit.dart';
import 'package:dealdash/feature/home/logic/category/category_cubit.dart';
import 'package:dealdash/feature/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/services/service_locator.dart';
import '../../../favourite/presentation/view/favoruite_view.dart';
import '../../../location/logic/store_cubit/store_cubit.dart';
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
  final LocationService _locationService = LocationService();

  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      BlocProvider(
        create: (context) => sl<CategoryCubit>()..fetchCategories(),
        child: const HomeView(),
      ),
      const FavoriteView(),
      currentLocation != null
          ? LocationView(currentLocation: currentLocation!)
          : Container(),
      const NotificationView(),
      BlocProvider(
        create: (context) => sl<LogoutCubit>(),
        child: ProfileView(),
      ),
    ];
  }

  void _onItemTapped(int index) async {
    if (index == 2) {
      LocationData? locationData =
          await _locationService.requestLocationPermission();
      if (locationData != null) {
        setState(() {
          currentLocation = locationData;
          _pages[2] = BlocProvider(
            create: (context) => sl<StoreCubit>(),
            child: LocationView(currentLocation: currentLocation!),
          );
          _selectedIndex = 2;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to get location")),
        );
      }
    } else {
      // التنقل العادي
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDarkMode ? ColorManager.gray.withOpacity(0.2) : ColorManager.gray;
    final color = isDarkMode ? ColorManager.whitGreen : ColorManager.primary;
    final activeColor = isDarkMode ? ColorManager.red : ColorManager.yellow;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        cornerRadius: 16,
        backgroundColor: backgroundColor,
        color: color,
        activeColor: activeColor,
        shadowColor: ColorManager.primary,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.favorite, title: 'Favorite'),
          TabItem(
            icon: Icons.location_on,
          ),
          TabItem(icon: Icons.notifications, title: 'Notify'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

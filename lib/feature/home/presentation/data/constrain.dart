import 'package:flutter/material.dart';

import '../../../favoruite/presentation/view/favoruite_view.dart';
import '../../../notification/presentation/view/notification_view.dart';
import '../../../profile/presentation/view/profile_view.dart';
import '../view/home_view.dart';

final List<Widget> pages = [
  const HomeView(),
  const FavoriteView(),
  const Placeholder(), // صفحة Placeholder مكان الزر العائم (لن تستخدم)
  const NotificationView(),
  const ProfileView(),
  Container(color: Colors.red,)
];
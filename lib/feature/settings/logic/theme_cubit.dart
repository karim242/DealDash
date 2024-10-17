import 'package:dealdash/core/cache_helper/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    bool? isDarkMode = CacheHelper.getThemeMode();
    if (isDarkMode != null) {
      emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    }
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      CacheHelper.saveThemeMode(true); // تخزين الثيم كـ dark
    } else {
      emit(ThemeMode.light);
      CacheHelper.saveThemeMode(false); // تخزين الثيم كـ light
    }
  }
}
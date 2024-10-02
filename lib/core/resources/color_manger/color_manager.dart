import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = const Color(0XFF004643);
  static Color gray = const Color(0XFFEff0f3);
  static Color whitGreen = const Color(0XFFABD1C6);
  static Color yellow = const Color(0XFFf9bc60);
  static Color red = const Color(0XFFe16162);
  static Color white = Colors.white;

}

class ThemeManager {
    static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.gray,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      foregroundColor: Colors.white,
    ),
    
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.yellow,
      textTheme: ButtonTextTheme.primary,
    ),
    
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.gray.withOpacity(0.1),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      foregroundColor: Colors.white,
    ),
   
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.red,
      textTheme: ButtonTextTheme.primary,
    ),
  
  );
}
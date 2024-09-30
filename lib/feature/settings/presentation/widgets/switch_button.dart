import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/feature/settings/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool _isDarkMode; 

  @override
  void initState() {
    super.initState();
    _isDarkMode = context.read<ThemeCubit>().state == ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>(); 

    return Switch(
      value: _isDarkMode, 
      onChanged: (value) {
        setState(() {
          _isDarkMode = value; 
          themeCubit.toggleTheme(); 
        });
      },
      activeColor: ColorManager.whitGreen,
      inactiveThumbColor: ColorManager.gray,
    );
  }
}
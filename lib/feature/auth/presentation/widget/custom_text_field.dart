import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manger/color_manager.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.prefixIcon,
      this.obscureText = false});

  final String labelText;
  final int maxLines;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 45,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        
        style:  TextStyle(color: ColorManager.whitGreen),
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return '$labelText is required ';
          } else {
            return null;
          }
        },
        cursorColor: ColorManager.gray,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          labelText: labelText,
          prefixIcon:prefixIcon,
          prefixIconColor: ColorManager.yellow,
          labelStyle: TextStyle(color: ColorManager.gray),
          fillColor: ColorManager.gray,
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          errorBorder: errorBuildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(
          color: ColorManager.whitGreen,
        ));
  }
  
  OutlineInputBorder errorBuildBorder() {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(
          color: ColorManager.red,
        ));
  }
}
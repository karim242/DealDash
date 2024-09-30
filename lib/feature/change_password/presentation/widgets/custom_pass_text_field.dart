import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manger/color_manager.dart';

class CustomPassTextField extends StatelessWidget {
  const CustomPassTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validator,
     });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45.h,
          child: TextFormField(
            controller: controller,
            obscureText: true,
            validator: validator,
            decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.symmetric(
                    vertical: 8.h, horizontal: 8.w),
                hintText: hintText,
                hintStyle: TextStyle(color: ColorManager.primary),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.whitGreen),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.whitGreen),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.red),
                )),
          ),
        ),
        SizedBox(height: 12.h)
      ],
    );
  }
}

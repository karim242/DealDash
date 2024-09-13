import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routes_manger/routes_manager.dart';


class CustomLoginRow extends StatelessWidget {
  const CustomLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
         "Don\'t have an account?",
          style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: ColorManager.whitGreen,)
          //style: TextStyles.textStyle10,
        ),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).push(Routes.signUpRoute);
            },
            child: Text(
              "Register Now",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.yellow,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorManager.red),
            ))
      ],
    );
  }
}
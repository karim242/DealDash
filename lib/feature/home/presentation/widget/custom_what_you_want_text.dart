import 'package:flutter/material.dart';

import '../../../../core/resources/font_manger/font_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
class CustomWhatYouWantText extends StatelessWidget {
  const CustomWhatYouWantText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        AppStrings.customWhatYouWantText,
        style: TextStyle(fontSize: 22, fontFamily: FontConstants.sultan),
      ),
    );
  }
}

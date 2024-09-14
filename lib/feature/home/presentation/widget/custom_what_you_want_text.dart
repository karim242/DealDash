import 'package:flutter/material.dart';

import '../../../../core/resources/font_manger/font_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';

class CustomWhatYouWantText extends StatelessWidget {
  final String title;

  const CustomWhatYouWantText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontFamily: FontConstants.sultan),
      ),
    );
  }
}

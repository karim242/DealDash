import 'package:flutter/material.dart';

import '../../../../core/resources/font_manger/font_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';

class TextWidget extends StatelessWidget {
  final String title;

  const TextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

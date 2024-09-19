import 'package:flutter/material.dart';

import '../../../../core/resources/image_manger/image_manger.dart';
class CustomImageLogo extends StatelessWidget {
  const CustomImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.only(right: 8) ,
        height: 50,
        width: 50,
        child:
        Image.asset(fit: BoxFit.cover, ImageManger.splash));
  }
}

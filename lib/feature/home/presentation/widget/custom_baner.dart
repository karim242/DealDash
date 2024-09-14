import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/font_manger/font_manager.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';

class CustomBaner extends StatelessWidget {
  const CustomBaner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerRight,
      color: ColorManager.green,
      height: height * .06,
      width: double.infinity,
      child: RichText(
        textDirection: TextDirection.rtl,

        text: TextSpan(
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: FontConstants.sultan),
          children:  <TextSpan>[
            TextSpan(
              text: AppStrings.customBanerOfferText,
            ),
            TextSpan(
              text: AppStrings.customBanerOneHPText,
              style: const TextStyle(backgroundColor: Colors.yellow,  ),
            ),
            TextSpan(
              text: AppStrings.customBanerPromoCodeText,

            ),
          ],
        ),
      ),
    );
  }
}

// class CustomBaner extends StatefulWidget {
//   @override
//   _NewsTickerState createState() => _NewsTickerState();
// }
//
// class _NewsTickerState extends State<CustomBaner> {
//   final ScrollController _scrollController = ScrollController();
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _startAutoScroll();
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
//
// List <Widget> list=[CustomText(text: AppStrings.customBanerOfferText, )];
// int count=0;
//
//   void _startAutoScroll() {
//
//     _timer = Timer.periodic(const Duration(milliseconds: 100),
//           (timer) {
//
//       if (_scrollController.hasClients) {
//         count++;
//         _scrollController.animateTo(
//           _scrollController.offset + 5, // تحريك بكسل واحدة كل مرة
//           duration: const Duration(milliseconds: 100),
//           curve: Curves.linear,
//         );
//       }
//       check();
//     },
//
//     );
//   }
// check(){
//     print(count);
//     // if(count==list.length){
//     //  setState(() {
//     //    _startAutoScroll();
//     //  });
//     // }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: ColorManager.green,
//       height: 50, // ارتفاع الشريط
//       child: ListView(
//         reverse: true,
//           controller: _scrollController,
//           scrollDirection: Axis.horizontal,
//           children: list),
//     );
//   }
//
//   // Widget _buildNewsItem() {
//   //
//   // }
// }
//
// class CustomText extends StatelessWidget {
//   final String text;
//    CustomText({super.key, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//       return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Center(
//         child: Text(
//           textDirection: TextDirection.rtl,
//           text,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

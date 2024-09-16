// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class CustomOfferAutoPageView extends StatefulWidget {
//   const CustomOfferAutoPageView({super.key});
//
//   @override
//   _CustomOfferAutoPageViewState createState() => _CustomOfferAutoPageViewState();
// }
// List<String> image = [
//   "assets/images/addis.png",
//   "assets/images/im4.png",
//   "assets/images/im7.png",
// ];
// class _CustomOfferAutoPageViewState extends State<CustomOfferAutoPageView> {
//   final PageController _pageController = PageController();
//   Timer? _timer;
//
//   int _currentPage = image.length-1;
//
//   @override
//   void initState() {
//     super.initState();
//     _startAutoScroll();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
//       if (_currentPage == 0) {
//         _pageController.jumpToPage(image.length-1);
//         _currentPage = image.length-1;
//       } else {
//         _currentPage--;
//       }
//       _pageController.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: _pageController,
//       scrollDirection: Axis.horizontal,
//       children: <Widget>[
//         ItemPageViewAddisWidget(imagePath:  image[0] ,function: (){print("object");},)
//
//       ],
//     );
//   }
// }
//
// class CustomOfferAutoPageViewDetails extends StatelessWidget {
//   const CustomOfferAutoPageViewDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }
//
//

import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/feature/onbording_splash/presentation/widget/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routes_manger/routes_manager.dart';
import '../widget/custom_progress_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPages() {
    return [
      const OnboardingPage(
        image: 'assets/images/onboarding1.png',
        title: 'Browse all the category',
        description: 'All categories we have, don\'t go far.',
      ),
      const OnboardingPage(
        image: 'assets/images/onboarding3.png',
        title: 'Amazing Discounts & Offers',
        description: 'Discounts and offers on all products',
      ),
      const OnboardingPage(
        image: 'assets/images/onboarding2.png',
        title: 'Offers next to you',
        description: 'Don\'t go far, there are offers next to you',
      ),
    ];
  
  }

  void _onNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else if( _currentPage ==2){
      context.go(Routes.rootViewRoute);
    }
    else {
      // Finish onboarding, navigate to home or login screen
      print("Onboarding finished");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: _buildPages(),
            ),
          ),
          const SizedBox(height: 20),
          // هنا يتم عرض Progress Indicator دائري مخصص
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomProgressIndicator(currentPage: _currentPage, onTap: _onNextPage,),
          ),
          const SizedBox(height: 20),
      
       
        ],
      ),
    );
  }
}

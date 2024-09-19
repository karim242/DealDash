import 'package:flutter/material.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
import 'custom_list_view_category.dart';
import 'text_widget.dart';
class TestCustomDivWhatYouWantWidget extends StatelessWidget {
  final  double height;
  final double width;
  const TestCustomDivWhatYouWantWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          //valu addidas
          SizedBox(
            height: height * .2,
            child:  Container(color: Colors.red,width: 100,height: 100,),
          ),
          SizedBox(height: height * .01),
          TextWidget(
            title: AppStrings.whatYouWantText,
          ),
          SizedBox(height: height * .01),
          // const SizedBox(height: 100, child: ListViewCategoryWidget()),
          TextWidget(
            title: AppStrings.suggestedForYou,
          ),
        ],
      ),
    );
  }
}

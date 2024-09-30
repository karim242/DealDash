import 'package:dealdash/feature/settings/presentation/widgets/setting_item_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.itemTitle, required this.sideSettingWidget,  this.iconData, required this.isPreIcon});

  final String itemTitle;
  final Widget sideSettingWidget;
  final bool isPreIcon;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsetsDirectional.symmetric(vertical: 8.h),
          child: Row(
            children: [
              if(isPreIcon)
                Row(
                  children: [
                    Icon(iconData),
                    SizedBox(width: 4.w),
                  ],
                ),
              SettingItemText(title: itemTitle),
              const Spacer(),
              sideSettingWidget,
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

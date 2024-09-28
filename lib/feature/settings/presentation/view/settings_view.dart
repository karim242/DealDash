import 'package:dealdash/core/widget/custome_appbar.dart';
import 'package:dealdash/feature/settings/presentation/widgets/language_drop_down.dart';
import 'package:dealdash/feature/settings/presentation/widgets/setting_item.dart';
import 'package:dealdash/feature/settings/presentation/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Settings'),
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SettingItem(
                itemTitle: "Dark Mode",
                sideSettingWidget: SwitchButton(),
                isPreIcon: false,
              ),
              SizedBox(height: 8.h),
              const Divider(),
              const SettingItem(
                itemTitle: "Language",
                sideSettingWidget: LanguageDropDown(),
                isPreIcon: true,
                iconData: Icons.language,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

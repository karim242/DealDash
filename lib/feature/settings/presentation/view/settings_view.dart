import 'package:dealdash/core/resources/routes_manger/routes_manager.dart';
import 'package:dealdash/core/widget/custom_appbar.dart';
import 'package:dealdash/feature/settings/presentation/widgets/custom_arrow_forward_button.dart';
import 'package:dealdash/feature/settings/presentation/widgets/language_drop_down.dart';
import 'package:dealdash/feature/settings/presentation/widgets/setting_item.dart';
import 'package:dealdash/feature/settings/presentation/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
        child:  SingleChildScrollView(
          child: Column(
            children: [
              const SettingItem(
                itemTitle: "Dark Mode",
                sideSettingWidget: SwitchButton(),
                isPreIcon: false,
              ),
              const SettingItem(
                itemTitle: "Language",
                sideSettingWidget: LanguageDropDown(),
                isPreIcon: true,
                iconData: Icons.language,
              ),
              SettingItem(
                itemTitle: "Change Password",
                sideSettingWidget: CustomArrowForwardButton(onTap: () {
                  GoRouter.of(context).push(Routes.changePasswordRoute);
                },),
                isPreIcon: true,
                iconData: Icons.key_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

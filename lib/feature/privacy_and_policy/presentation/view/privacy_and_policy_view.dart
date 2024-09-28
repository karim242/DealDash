import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/widget/custome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyAndPolicyView extends StatelessWidget {
  const PrivacyAndPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Privacy and Policy"),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w,vertical: 16.h),
        child: SingleChildScrollView(
          child: Text(
            '''1. Introduction
Welcome to [App Name]! We value your privacy and are committed to protecting your personal data. This policy explains how we collect, use, and protect your information.

2. Information We Collect
Location Data: We collect your location to show nearby offers.
Device Info: We gather information like device ID and OS.
Contact Info: When you sign up, we may collect your name and email.
Usage Data: We track app usage to improve functionality.

3. How We Use Your Information
Provide location-based offers.
Improve app performance.
Personalize content and offers.
Send you updates and notifications.

4. Sharing Your Information
We do not sell your data. We may share it with:
Service Providers (e.g., for location services).
Authorities (if legally required).
5. Data Retention
We keep your data only as long as necessary for the purposes described or to comply with the law.

To format the Privacy Policy for display on a mobile app screen, it needs to be concise and scrollable. Here’s how it can be structured for in-app presentation:

Privacy Policy
Effective Date: [Insert Date]
1. Introduction
Welcome to [App Name]! We value your privacy and are committed to protecting your personal data. This policy explains how we collect, use, and protect your information.

2. Information We Collect

Location Data: We collect your location to show nearby offers.
Device Info: We gather information like device ID and OS.
Contact Info: When you sign up, we may collect your name and email.
Usage Data: We track app usage to improve functionality.
3. How We Use Your Information

Provide location-based offers.
Improve app performance.
Personalize content and offers.
Send you updates and notifications.
4. Sharing Your Information
We do not sell your data. We may share it with:
Service Providers (e.g., for location services).
Authorities (if legally required).
5. Data Retention
We keep your data only as long as necessary for the purposes described or to comply with the law.

6. Your Rights
You can:
Access or update your info.
Restrict certain data processing (like location tracking).
Withdraw consent at any time.
Contact us at [Insert Contact Info] to exercise your rights.

7. Security
We use measures to protect your data, but no method is 100% secure. We cannot guarantee absolute protection.

8. Children’s Privacy
Our app is not intended for children under 13. If we accidentally collect data from children, we will delete it.

9. Third-Party Links
We are not responsible for external sites linked through the app. Review their privacy policies before providing personal info.

10. Policy Updates
We may update this policy periodically. Changes will be posted in the app or communicated to you.

This version is streamlined for readability on a mobile app screen and easy navigation. Key sections are separated by line breaks, ensuring clarity and smooth scrolling

''',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: ColorManager.primary
            ),
          ),
        ),
      ),
    );
  }
}

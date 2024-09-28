import 'package:dealdash/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({super.key});

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {

  String selectedLanguage = 'English'; // Default selected language

  // List of languages with flag image paths
  final List<Map<String, String>> languages = [
    {'name': 'English', 'flag': Assets.languageFlagUs}, // Add appropriate path for flag
    {'name': 'Arabic', 'flag': Assets.languageFlagEg},
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedLanguage,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      style:  TextStyle(color: Colors.black, fontSize: 18.sp),
      onChanged: (String? newValue) {
        setState(() {
          selectedLanguage = newValue!;
        });
      },
      items: languages.map<DropdownMenuItem<String>>((Map<String, String> language) {
        return DropdownMenuItem<String>(
          value: language['name'],
          child: Row(
            children: [
              Image.asset(
                language['flag']!,
                width: 26,
                height: 24,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 10.w), // Space between flag and text
              Text(language['name']!),
            ],
          ),
        );
      }).toList(),
    );
  }
}


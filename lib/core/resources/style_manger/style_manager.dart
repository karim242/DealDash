import 'package:flutter/material.dart';

import '../font_manger/font_manager.dart';



TextStyle? _getTextStyle( double fontSize,String fontFamily,FontWeight fontWeight,Color color){
  return TextStyle(color: color ,fontFamily: fontFamily,fontWeight: fontWeight,fontSize: fontSize);
}


TextStyle? getRegularStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize ,FontConstants.poppins ,FontWeightManager.regular, color,);
}



TextStyle? getSemiBoldStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.poppins , FontWeightManager.bold, color,);
}

TextStyle? getSoultanSemiBoldStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.poppins , FontWeightManager.bold, color,);
}

class AppStyle{
  static  TextStyle sultan=TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: FontConstants.sultan);

}

class AppTheme{
 static ThemeData theme=ThemeData(
    textTheme: TextTheme(
      headlineMedium: AppStyle.sultan,
    )
  );
}

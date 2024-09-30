import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/widget/custom_appbar.dart';
import 'package:dealdash/feature/change_password/presentation/widgets/custom_pass_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Update Password"),
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(vertical: 16.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomPassTextField(
                  controller: _oldPasswordController,
                  hintText: "Current Password",
                  validator: (value){
                    if(value?.isEmpty ?? true){
                      return 'Old Password is required';
                    }
                    else{
                      return null;
                    }
                  },
                ),
                CustomPassTextField(
                  controller: _newPasswordController,
                  hintText: "New Password",
                  validator: (value){
                    if(value?.isEmpty ?? true){
                      return 'New Password is required';
                    }
                    else if(value!.length < 8){
                      return 'Password should be more than 8 characters';
                    }
                    else{
                      return null;
                    }
                  },
                ),
                CustomPassTextField(
                  controller: _confirmNewPasswordController,
                  hintText: "Confirm Password",
                  validator: (value){
                    if(value?.isEmpty ?? true){
                      return 'Confirm Password is required';
                    }
                    else if(value!.length < 8){
                      return 'Password should be more than 8 characters';
                    }
                    else if(_newPasswordController.text != _confirmNewPasswordController.text){
                      return 'Confirm password does not match new password';
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 35.h),
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      // _formKey.currentState!.save();
                    }
                  },
                  child: Container(
                      width: 175.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: ColorManager.whitGreen,
                        border: Border.all(color: ColorManager.primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5
                          ),
                        ),
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

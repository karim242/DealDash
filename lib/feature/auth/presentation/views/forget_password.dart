import 'package:dealdash/app.dart';
import 'package:dealdash/core/widget/custom_toast.dart';
import 'package:dealdash/feature/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:dealdash/feature/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../widget/custom_auth_btn.dart';
import '../widget/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordLoaded) {
                showToast(state.message);

                //Navigator to reset password
              } else if (state is ForgotPasswordError) {
                showToast(state.message);
              }
            },
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/authImage.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 22),
                        Text(
                          'Forget Password',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: ColorManager.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 22),
                        CustomTextField(
                          labelText: 'E-mail ',
                          controller: _emailController,
                          prefixIcon: const Icon(Icons.email),
                        ),
                        const SizedBox(height: 22),
                        CustomAuthBtn(
                            label: 'Send ',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<ForgotPasswordCubit>()
                                    .forgetPassword(
                                        email: _emailController.text);
                              }
                            })
                      ]),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

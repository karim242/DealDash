import 'package:dealdash/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:dealdash/feature/auth/presentation/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/resources/routes_manger/routes_manager.dart';
import '../../../../core/widget/custom_toast.dart';
import '../widget/custom_auth_btn.dart';
import '../widget/custom_login_row.dart';
import '../widget/custom_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is LoginSuccess) {
            showToast("You are In");
              GoRouter.of(context).push(Routes.rootViewRoute);
          } else if (state is LoginError) {
            showToast(state.errorMassage!);
          }
        }, builder: (context, state) {
          return SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.33,
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
                          Text(
                            'Log In to DealDash',
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
                          CustomTextField(
                            labelText: 'Password ',
                            controller: _passwordController,
                            obscureText: true,
                            prefixIcon: const Icon(Icons.lock),
                          ),
                          const SizedBox(height: 22),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(Routes.forgetPasswordRoute);
                              },
                              child: Text("Forget Password ?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: ColorManager.whitGreen,
                                  )
                                  //style: TextStyles.textStyle10,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 22),
                          state is LoginLoding
                              ? const Center(child: CircularProgressIndicator())
                              : CustomAuthBtn(
                                  label: 'Log In',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();

                                      BlocProvider.of<LoginCubit>(context)
                                          .login(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                    }
                                  },
                                ),
                          const SizedBox(height: 15),

                          // Continue with Facebook Button
                          CustomLoginRow()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

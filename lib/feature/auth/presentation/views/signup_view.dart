import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../../../core/widget/custom_toast.dart';
import '../cubit/signup/signup_cubit.dart';
import '../cubit/signup/signup_state.dart';
import '../widget/custom_auth_btn.dart';
import '../widget/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body:
            BlocConsumer<SignupCubit, SignupState>(listener: (context, state) {
          if (state is SignupSuccess) {
            showToast("You are In");
            //  GoRouter.of(context).push(RoutesNames.kRootView);
          } else if (state is SignupError) {
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
                            'Sign Up to DealDash',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: ColorManager.gray,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 22),

                          CustomTextField(
                            labelText: 'Name ',
                            controller: _nameController,
                            prefixIcon: const Icon(Icons.person),
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
                            obscureText: true,
                            controller: _passwordController,
                            prefixIcon: const Icon(Icons.lock),
                          ),

                          const SizedBox(height: 22),
                          CustomTextField(
                            labelText: 'phone ',
                            controller: _phoneController,
                            prefixIcon: const Icon(Icons.phone),
                          ),
                          const SizedBox(height: 22),

                          state is SignupLoding
                              ? const Center(child: CircularProgressIndicator())
                              : CustomAuthBtn(
                                  label: 'Sign Up',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();

                                      BlocProvider.of<SignupCubit>(context)
                                          .signUp(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                              phone: _phoneController.text,
                                              userName: _nameController.text);
                                    }
                                  },
                                ),
                          const SizedBox(height: 15),

                          // Continue with Facebook Button
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

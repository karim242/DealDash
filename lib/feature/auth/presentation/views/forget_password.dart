import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../widget/custom_auth_btn.dart';
import '../widget/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Form(
          key: formKey,
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
                            onPressed: () {})
                    ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

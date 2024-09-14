import 'package:flutter/material.dart';

import '../../../../core/resources/strings_manger/strings_manager.dart';
import 'custom_image_logo.dart';

class CustomSearchForm extends StatefulWidget {
  const CustomSearchForm({super.key});

  @override
  CustomSearchFormState createState() => CustomSearchFormState();
}

class CustomSearchFormState extends State<CustomSearchForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height:MediaQuery.of(context).size.height*.11,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomImageLogo(),
                  const SizedBox(width: 2,),
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration:  InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Process data
                              print('Input: ${_controller.text}');
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                        labelText: AppStrings.customSearchFormLabelText,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.customSearchFormValidatorText;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
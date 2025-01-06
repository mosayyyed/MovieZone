import 'package:flutter/material.dart';

import '../../../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../../../core/component/widgets/custom_phone_field.dart';
import '../../../../../../core/component/widgets/custom_text_field.dart';
import '../../../../../../core/themes/app_colors.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextField(
          labelText: 'Full Name',
          keyboardType: TextInputType.name,
        ),
        CustomTextField(
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextField(
          labelText: 'Password',
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          suffixIconVisibility: true,
          onSuffixIconPressed: () {},
        ),
        CustomTextField(
          labelText: 'Confirm Password',
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          suffixIconVisibility: true,
          onSuffixIconPressed: () {},
        ),
        CustomPhoneField(
          labelText: 'Phone Number',
        ),
        CustomElevatedButton(
          text: 'Create Account',
          textColor: Colors.black,
          backgroundColor: AppColors.kPrimaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}

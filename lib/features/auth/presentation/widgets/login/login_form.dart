import 'package:flutter/material.dart';

import '../../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../../core/component/widgets/custom_text_button.dart';
import '../../../../../core/component/widgets/custom_text_field.dart';
import '../../../../../core/themes/app_colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextField(
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextField(
          labelText: 'Password',
          obscureText: true,
          suffixIconVisibility: true,
          onSuffixIconPressed: () {},
          keyboardType: TextInputType.visiblePassword,
        ),
        CustomTextButton(
          text: 'Forgot Password?',
          alignment: Alignment.centerRight,
          onPressed: () {},
        ),
        CustomElevatedButton(
          text: 'Signin',
          textColor: AppColors.kSecondaryColor,
          backgroundColor: AppColors.kPrimaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}

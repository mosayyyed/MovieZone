import 'package:flutter/material.dart';

import '../../../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../../../core/component/widgets/custom_text_button.dart';
import '../../../../../../core/component/widgets/custom_text_field.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../generated/l10n.dart';

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
          labelText: S.of(context).email,
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextField(
          labelText: S.of(context).password,
          obscureText: true,
          suffixIconVisibility: true,
          onSuffixIconPressed: () {},
          keyboardType: TextInputType.visiblePassword,
        ),
        CustomTextButton(
          text: S.of(context).loginForgotPassword,
          alignment: Localizations.localeOf(context).languageCode == 'ar'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          onPressed: () {},
        ),
        CustomElevatedButton(
          text: S.of(context).loginButton,
          textColor: AppColors.kSecondaryColor,
          backgroundColor: AppColors.kPrimaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}

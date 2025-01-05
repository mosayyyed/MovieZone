import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/constants.dart';

class SignupWithSocialButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;

  const SignupWithSocialButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: AppColors.kGreyColor, width: 1),
            borderRadius: BorderRadius.circular(kBorderRadius))),
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
        backgroundColor: WidgetStateProperty.all(AppColors.kSecondaryColor),
      ),
      onPressed: onPressed,
      icon: icon,
    );
  }
}

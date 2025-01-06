import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/themes/app_colors.dart';

class SignupWithSocialButton extends StatelessWidget {
  const SignupWithSocialButton({
    super.key,
    required this.type,
    this.onPressed,
  });

  final SocialButtonType type;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Widget icon;
    Color backgroundColor;

    switch (type) {
      case SocialButtonType.facebook:
        icon = Icon(Icons.facebook, size: 30, color: Colors.white);
        backgroundColor = Color(0xFF3F579C);
        break;
      case SocialButtonType.google:
        icon = SvgPicture.asset(
          'assets/icons8-google.svg',
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        );
        backgroundColor = Colors.redAccent;
        break;
      case SocialButtonType.apple:
        icon = Icon(Icons.apple, size: 30, color: Colors.white);
        backgroundColor = Colors.black;
        break;
    }

    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: 30,
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(
        minWidth: 55,
        minHeight: 55,
      ),
      splashRadius: 30,
      color: AppColors.kGreyColor,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: AppColors.kGreyColor, width: 1),
          ),
        ),
      ),
    );
  }
}

enum SocialButtonType {
  facebook,
  google,
  apple,
}

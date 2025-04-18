import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/src/core/themes/app_values.dart';

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
        icon = Icon(Icons.facebook, size: 30.sp, color: Colors.white);
        backgroundColor = Color(0xFF3F579C);
        break;
      case SocialButtonType.google:
        icon = SvgPicture.asset(
          'assets/icons8-google.svg',
          width: 30.w,
          height: 30.h,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        );
        backgroundColor = Colors.redAccent;
        break;
      case SocialButtonType.apple:
        icon = Icon(Icons.apple, size: 30.sp, color: Colors.white);
        backgroundColor = Colors.black;
        break;
    }

    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: 30.sp,
      padding: EdgeInsets.all(AppPadding.p12.w),
      constraints: BoxConstraints(
        minWidth: 55.w,
        minHeight: 55.h,
      ),
      splashRadius: 30.sp,
      color: Theme.of(context).colorScheme.onPrimary,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12.r),
            side: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary, width: 1.w),
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

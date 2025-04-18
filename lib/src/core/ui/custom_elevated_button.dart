import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/themes/app_values.dart';

import '../themes/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.onPressed,
  });

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
        ),
        minimumSize: Size(double.infinity, 45.h),
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 15.h),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle16.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

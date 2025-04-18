import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/core/themes/app_values.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final String? highlightText;
  final VoidCallback? onPressed;
  final AlignmentGeometry? alignment;

  const CustomTextButton({
    super.key,
    required this.text,
    this.highlightText,
    this.onPressed,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        alignment: alignment,
        minimumSize: WidgetStateProperty.all<Size>(
          Size(double.infinity, 0.h),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12.r),
          ),
        ),
      ),
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: Styles.textStyle14.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: 'Cairo',
              ),
            ),
            TextSpan(
              text: highlightText,
              style: Styles.textStyle14.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

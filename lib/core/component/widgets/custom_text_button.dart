import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/utils/constants.dart';

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
          const Size(double.infinity, 0),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
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
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
            ),
            TextSpan(
              text: highlightText,
              style: Styles.textStyle14.copyWith(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

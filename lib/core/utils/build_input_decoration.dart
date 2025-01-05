import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_styles.dart';
import 'constants.dart';

InputDecoration buildInputDecoration({
  String? hintText,
  required String labelText,
  Widget? prefixIcon,
  bool suffixIconVisibility = false,
  bool obscureText = false,
  VoidCallback? onSuffixIconPressed,
}) {
  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: BorderSide.none,
  );

  final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: const BorderSide(
      color: AppColors.kPrimaryColor,
      width: 1.5,
    ),
  );

  final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: const BorderSide(
      color: AppColors.kErrorColor,
      width: 1.5,
    ),
  );

  return InputDecoration(
    hintText: hintText,
    hintStyle: Styles.textStyle14,
    label: Text(
      labelText.toUpperCase(),
      style: Styles.textStyle12.copyWith(color: AppColors.kGreyColor),
    ),
    filled: true,
    fillColor: AppColors.kFillColor,
    border: border,
    enabledBorder: border,
    focusedBorder: focusedBorder,
    focusedErrorBorder: errorBorder,
    errorBorder: errorBorder,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIconVisibility
        ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.kGreyColor,
            ),
            onPressed: onSuffixIconPressed,
          )
        : null,
  );
}

import 'package:flutter/material.dart';

import '../themes/app_styles.dart';
import 'constants.dart';

InputDecoration buildInputDecoration({
  String? hintText,
  String? labelText,
  Widget? prefixIcon,
  bool suffixIconVisibility = false,
  bool obscureText = false,
  required BuildContext context,
  VoidCallback? onSuffixIconPressed,
}) {
  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: BorderSide.none,
  );

  final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.primary,
      width: 1.5,
    ),
  );

  final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.error,
      width: 1.5,
    ),
  );

  return InputDecoration(
    hintText: hintText,
    hintStyle: Styles.textStyle14
        .copyWith(color: Theme.of(context).colorScheme.secondary),
    label: Text(
      labelText ?? "",
      style: Styles.textStyle12.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.bold),
    ),
    errorMaxLines: 2,
    errorStyle: TextStyle(
      color: Theme.of(context).colorScheme.error.withAlpha(180),
      fontSize: 12,
      overflow: TextOverflow.ellipsis,
    ),
    filled: true,
    fillColor: Theme.of(context).colorScheme.surface,
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
              color: Colors.grey.withOpacity(0.6),
            ),
            onPressed: onSuffixIconPressed,
          )
        : null,
  );
}

import 'package:flutter/material.dart';

InputDecoration buildInputDecoration({
  String? hintText,
  String? labelText,
  Widget? prefixIcon,
  bool suffixIconVisibility = false,
  bool obscureText = false,
  required BuildContext context,
  VoidCallback? onSuffixIconPressed,
}) {
  return InputDecoration(
    hintText: hintText,
    label: Text(labelText ?? ""),
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

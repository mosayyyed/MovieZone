import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themes/app_styles.dart';
import '../utils/build_input_decoration.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.helperText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIconVisibility = false,
    this.onSuffixIconPressed,
    this.readOnly = false,
  });

  final String labelText;
  final String? hintText;
  final String? helperText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool suffixIconVisibility;
  final VoidCallback? onSuffixIconPressed;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: Styles.textStyle16.copyWith(fontSize: 16.sp),
      decoration: buildInputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIconVisibility: suffixIconVisibility,
          obscureText: obscureText,
          onSuffixIconPressed: onSuffixIconPressed,
          context: context),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/src/core/themes/app_values.dart';

class MySingleChildScrollView extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  const MySingleChildScrollView(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.symmetric(horizontal: AppPadding.p16)});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: padding,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_values.dart';

class MySingleChildScrollView extends StatelessWidget {
  final Widget child;
  const MySingleChildScrollView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: child,
    );
  }
}

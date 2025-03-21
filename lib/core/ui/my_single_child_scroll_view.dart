import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      color: AppColors.kPrimaryColor,
      strokeWidth: 4,
      displacement: 100,
      backgroundColor: AppColors.kSecondaryColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}

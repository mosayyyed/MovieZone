import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      color: Theme.of(context).colorScheme.primary,
      strokeWidth: 4,
      displacement: 100.sp,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      onRefresh: onRefresh,
      child: child,
    );
  }
}

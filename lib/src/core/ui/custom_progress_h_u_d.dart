import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/themes/app_values.dart';

class CustomProgressHUD extends StatelessWidget {
  final Widget child;

  const CustomProgressHUD({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return ProgressHUD(
      backgroundRadius: Radius.circular(AppSize.s12.r),
      barrierColor: Theme.of(context).colorScheme.surface.withAlpha(100),
      borderColor: Colors.transparent,
      borderWidth: 2,
      barrierEnabled: true,
      indicatorColor: Theme.of(context).colorScheme.primary,
      indicatorWidget: isIOS
          ? CupertinoActivityIndicator(radius: 16.r)
          : CircularProgressIndicator(strokeWidth: 2.r),
      child: child,
    );
  }
}

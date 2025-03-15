import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../utils/constants.dart';

class CustomProgressHUD extends StatelessWidget {
  final Widget child;
  const CustomProgressHUD({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      backgroundRadius: Radius.circular(kBorderRadius),
      barrierColor: Theme.of(context).colorScheme.surface.withAlpha(100),
      borderColor: Colors.transparent,
      borderWidth: 2,
      barrierEnabled: true,
      indicatorColor: Theme.of(context).colorScheme.primary,
      indicatorWidget: CupertinoActivityIndicator(
        radius: 30,
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/features/onboarding/presentation/ui/skip_button.dart';

class ArrowBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArrowBackAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: SkipButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.onSurface,
            size: 22,
          ),
          hasBorderSide: true,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}

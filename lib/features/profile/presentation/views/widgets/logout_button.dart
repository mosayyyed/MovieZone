import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/ui/custom_elevated_button.dart';
import 'package:movie_app/generated/l10n.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomElevatedButton(
      text: S.of(context).logout,
      backgroundColor: theme.colorScheme.error,
      textColor: theme.colorScheme.onError,
      onPressed: () {
        FirebaseAuth.instance.signOut();
        GoRouter.of(context).go(AppRoutes.kLoginRoute);
      },
    );
  }
}

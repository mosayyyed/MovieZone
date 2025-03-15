import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/custom_progress_h_u_d.dart';
import '../../../onboarding/presentation/widgets/skip_button.dart';
import 'widgets/email_verification/email_verification_body.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = GoRouterState.of(context).uri.queryParameters['email'];

    return CustomProgressHUD(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: SkipButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 22,
              ),
              hasBorderSide: true,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ),
        ),
        body: EmailVerificationBody(email: email),
      ),
    );
  }
}

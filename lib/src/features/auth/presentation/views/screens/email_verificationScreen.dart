import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/ui/arrow_back_app_bar.dart';
import '../../../../../core/ui/custom_progress_h_u_d.dart';
import '../ui/email_verification/email_verification_body.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = GoRouterState.of(context).uri.queryParameters['email'];

    return CustomProgressHUD(
      child: Scaffold(
        appBar: const ArrowBackAppBar(),
        body: EmailVerificationBody(email: email),
      ),
    );
  }
}

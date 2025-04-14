import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../onboarding/presentation/widgets/skip_button.dart';
import '../widgets/signup/signup_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Theme.of(context).colorScheme.onSurface,
              size: 22,
            ),
            hasBorderSide: true,
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
      ),
      body: SignupBody(),
    );
  }
}

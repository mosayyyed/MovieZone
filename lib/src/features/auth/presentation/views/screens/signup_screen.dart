import 'package:flutter/material.dart';
import 'package:movie_app/src/core/ui/arrow_back_app_bar.dart';
import 'package:movie_app/src/features/auth/presentation/views/ui/signup/signup_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(),
      body: SignupBody(),
    );
  }
}

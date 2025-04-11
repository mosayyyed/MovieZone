import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_styles.dart';
import 'package:movie_app/core/ui/custom_elevated_button.dart';
import 'package:movie_app/core/ui/custom_text_field.dart';
import 'package:movie_app/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).loginButton,
                style: Styles.boldTextStyle24,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                labelText: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: S.of(context).password,
                obscureText: true,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(S.of(context).loginForgotPassword),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: CustomElevatedButton(
                  onPressed: () {},
                  text: S.of(context).loginButton,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).loginDontHaveAccText),
                  TextButton(
                    onPressed: () {},
                    child: Text(S.of(context).loginButton),
                  ),
                ],
              ),
            ],              
          ),
        ),
      ),
    );
  }
}

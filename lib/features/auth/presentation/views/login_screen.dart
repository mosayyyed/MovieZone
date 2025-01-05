import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/auth/presentation/widgets/or_divider.dart';

import '../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../core/component/widgets/custom_text_button.dart';
import '../../../../core/component/widgets/custom_text_field.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/signup_with_social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextButton(
              text: 'Don\'t have an account? ',
              highlightText: 'Register',
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kSignupRoute);
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 84),
              SvgPicture.asset(
                'assets/movieisme-logo.svg',
                width: 100,
                colorFilter:
                    ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
              ),
              SizedBox(height: 84 * 1.5),
              CustomTextField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: 'Password',
                obscureText: true,
                suffixIconVisibility: true,
                onSuffixIconPressed: () {},
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16),
              CustomElevatedButton(
                text: 'Signin',
                textColor: AppColors.kSecondaryColor,
                backgroundColor: AppColors.kPrimaryColor,
                onPressed: () {},
              ),
              SizedBox(height: 32),
              OrDivider(),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  SignupWithSocialButton(
                      icon:
                          Icon(Icons.facebook, size: 30, color: Colors.white)),
                  SignupWithSocialButton(
                    icon: SvgPicture.asset(
                      'assets/icons8-google.svg',
                      width: 30,
                      height: 30,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  SignupWithSocialButton(
                      icon: Icon(Icons.apple, size: 30, color: Colors.white)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

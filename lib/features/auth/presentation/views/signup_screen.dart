import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/component/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/themes/app_styles.dart';

import '../../../../core/component/widgets/custom_phone_field.dart';
import '../../../../core/component/widgets/custom_text_button.dart';
import '../../../../core/component/widgets/custom_text_field.dart';
import '../../../../core/themes/app_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextButton(
                text: 'Already have an account? ',
                highlightText: 'Signin',
                onPressed: () {
                  GoRouter.of(context).pop(AppRoutes.kLoginRoute);
                },
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 64,
                ),
                Text(
                  'Create Account',
                  style: Styles.textStyle32.copyWith(
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!',
                  style: Styles.textStyle12.copyWith(),
                ),
                SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  labelText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  suffixIconVisibility: true,
                  onSuffixIconPressed: () {},
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  labelText: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  suffixIconVisibility: true,
                  onSuffixIconPressed: () {},
                ),
                SizedBox(
                  height: 16,
                ),
                CustomPhoneField(
                  labelText: 'Phone Number',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomElevatedButton(
                  text: 'Create Account',
                  textColor: Colors.black,
                  backgroundColor: AppColors.kPrimaryColor,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 22,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By logging. your agree to our and ',
                        style: Styles.textStyle12.copyWith(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: Styles.textStyle12.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: Styles.textStyle12.copyWith(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: Styles.textStyle12.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ));
  }
}

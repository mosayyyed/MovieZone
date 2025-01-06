import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/component/widgets/custom_text_button.dart';
import '../../../../../core/component/widgets/my_single_child_scroll_view.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_styles.dart';
import 'signup_form.dart';
import 'terms_and_conditions.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MySingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            'Create Account',
            style: Styles.textStyle32.copyWith(
                color: AppColors.kPrimaryColor, fontWeight: FontWeight.w600),
          ),
          Text(
            'Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!',
            style: Styles.textStyle12.copyWith(),
          ),
          SizedBox(
            height: 32,
          ),
          SignupForm(),
          SizedBox(
            height: 22,
          ),
          TermsAndConditions(),
          SizedBox(
            height: 22,
          ),
          CustomTextButton(
            text: 'Already have an account? ',
            highlightText: 'Signin',
            onPressed: () {
              GoRouter.of(context).pop(AppRoutes.kLoginRoute);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ],
      ),
    );
  }
}

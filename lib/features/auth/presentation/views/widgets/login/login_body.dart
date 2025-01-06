import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/component/widgets/custom_text_button.dart';
import '../../../../../../core/component/widgets/my_single_child_scroll_view.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../or_divider.dart';
import 'login_form.dart';
import 'signup_with_social_row.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MySingleChildScrollView(
      child: Column(
        spacing: 32,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          SvgPicture.asset(
            'assets/movieisme-logo.svg',
            width: 100,
            colorFilter:
                ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          LoginForm(),
          OrDivider(),
          SignupWithSocialRow(),
          CustomTextButton(
            text: 'Don\'t have an account? ',
            highlightText: 'Register',
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kSignupRoute);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ],
      ),
    );
  }
}

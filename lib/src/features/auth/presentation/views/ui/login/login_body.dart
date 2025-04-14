import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/ui/custom_progress_h_u_d.dart';
import 'package:movie_app/src/features/auth/presentation/controller/auth/auth_cubit.dart';

import '../../../../../../core/ui/custom_text_button.dart';
import '../../../../../../core/ui/my_single_child_scroll_view.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../../generated/l10n.dart';
import '../or_divider.dart';
import 'login_form.dart';
import 'signup_with_social_row.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomProgressHUD(
      child: MySingleChildScrollView(
        child: Column(
          spacing: 32,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            SvgPicture.asset(
              'assets/movieisme-logo.svg',
              width: 100,
              colorFilter:
                  ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            LoginForm(),
            OrDivider(),
            SignupWithSocialRow(),
            CustomTextButton(
              text: S.of(context).loginDontHaveAccText,
              highlightText: S.of(context).loginDontHaveAccHighlightText,
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kSignupRoute,
                    extra: context.read<AuthCubit>());
              },
            ),
          ],
        ),
      ),
    );
  }
}

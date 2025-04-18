import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/ui/custom_progress_h_u_d.dart';
import '../../../../../../core/ui/custom_text_button.dart';
import '../../../../../../core/ui/my_single_child_scroll_view.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../../generated/l10n.dart';
import 'signup_form.dart';
import 'terms_and_conditions.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomProgressHUD(
      child: MySingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              S.of(context).createAccountText,
              style: Styles.textStyle32.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              S.of(context).registerDescriptionText,
              style: Styles.textStyle12.copyWith(),
            ),
            SizedBox(
              height: 32.h,
            ),
            SignupForm(),
            SizedBox(
              height: 22.h,
            ),
            TermsAndConditions(),
            SizedBox(
              height: 22.h,
            ),
            CustomTextButton(
              text: S.of(context).signupHaveAccText,
              highlightText: S.of(context).signupHaveAccHighlightText,
              onPressed: () {
                GoRouter.of(context).pop(AppRoutes.kLoginRoute);
              },
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}

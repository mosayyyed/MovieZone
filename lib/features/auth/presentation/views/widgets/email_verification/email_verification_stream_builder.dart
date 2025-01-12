import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../controller/auth/auth_cubit.dart';

class EmailVerificationStreamBuilder extends StatefulWidget {
  const EmailVerificationStreamBuilder({
    super.key,
  });

  @override
  EmailVerificationStreamBuilderState createState() =>
      EmailVerificationStreamBuilderState();
}

class EmailVerificationStreamBuilderState
    extends State<EmailVerificationStreamBuilder> {
  bool hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    final progress = ProgressHUD.of(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return StreamBuilder<bool>(
      stream: authCubit.emailVerificationStream(FirebaseAuth.instance),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data!) {
          if (!hasNavigated) {
            hasNavigated = true;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              progress?.show();
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.success(
                  message: S.of(context).verificationSuccess,
                ),
              );

              Future.delayed(const Duration(seconds: 3), () {
                progress?.dismiss();

                GoRouter.of(context).go(AppRoutes.kHomeRoute);
              });
            });
          }

          return const SizedBox();
        }

        return CustomElevatedButton(
          text: S.of(context).resend,
          textColor: Colors.white,
          backgroundColor: AppColors.kPrimaryColor,
          onPressed: () {
            authCubit.resendEmailVerification();
          },
        );
      },
    );
  }
}

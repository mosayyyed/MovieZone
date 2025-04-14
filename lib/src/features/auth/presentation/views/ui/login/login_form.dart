import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/utils/form_validator.dart';
import 'package:movie_app/src/features/auth/data/models/login_request_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../core/ui/custom_elevated_button.dart';
import '../../../../../../core/ui/custom_text_button.dart';
import '../../../../../../core/ui/custom_text_field.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../controller/auth/auth_cubit.dart';
import '../../../controller/login/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    final progress = ProgressHUD.of(context);

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          progress?.show();
        } else if (state is LoginError) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.message,
            ),
          );
          progress?.dismiss();
        } else if (state is LoginSuccess) {
          progress?.dismiss();
          navigate(context, authCubit);
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Form(
              key: loginCubit.formKey,
              child: Column(
                spacing: 16,
                children: [
                  CustomTextField(
                    labelText: S.of(context).email,
                    keyboardType: TextInputType.emailAddress,
                    controller: loginCubit.emailController,
                    validator: (value) => FormValidator.validateEmail(value),
                  ),
                  CustomTextField(
                    labelText: S.of(context).password,
                    suffixIconVisibility: true,
                    keyboardType: TextInputType.visiblePassword,
                    onSuffixIconPressed: authCubit.togglePasswordVisibility,
                    obscureText: !authCubit.isPasswordVisible,
                    controller: loginCubit.passwordController,
                    validator: (value) => FormValidator.validatePassword(value),
                  ),
                  CustomTextButton(
                    text: S.of(context).loginForgotPassword,
                    alignment:
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    onPressed: () {},
                  ),
                  CustomElevatedButton(
                    text: S.of(context).loginButton,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      if (loginCubit.formKey.currentState!.validate()) {
                        loginCubit.login(
                          loginRequestModel: LoginRequestModel(
                              email: loginCubit.emailController.text,
                              password: loginCubit.passwordController.text),
                        );
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: S.of(context).invalidDataInput,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> navigate(BuildContext context, dynamic authCubit) async {
    final isVerified = await authCubit.checkEmailVerification();
    if (isVerified) {
      GoRouter.of(context).go(AppRoutes.kHomeRoute);
    } else {
      GoRouter.of(context).push(
          '${AppRoutes.kEmailVerificationRoute}?email=${BlocProvider.of<LoginCubit>(context).emailController.text}',
          extra: context.read<AuthCubit>());
    }
  }
}

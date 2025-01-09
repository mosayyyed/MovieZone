import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/auth/data/models/login_request_model.dart';

import '../../../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../../../core/component/widgets/custom_text_button.dart';
import '../../../../../../core/component/widgets/custom_text_field.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../generated/l10n.dart';
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

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                action: SnackBarAction(
                  label: 'Close',
                  textColor: AppColors.kSecondaryColor,
                  backgroundColor: AppColors.kWarningColor,
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                content: Text(state.message),
                backgroundColor: AppColors.kErrorColor,
              ),
            );
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                action: SnackBarAction(
                  label: 'Close',
                  textColor: AppColors.kSecondaryColor,
                  backgroundColor: AppColors.kSuccessColor,
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                content: Text('Login Success'),
                backgroundColor: AppColors.kSuccessColor,
              ),
            );
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
                    validator: (value) =>
                        authCubit.emailValidator(value, context),
                  ),
                  CustomTextField(
                    labelText: S.of(context).password,
                    suffixIconVisibility: true,
                    keyboardType: TextInputType.visiblePassword,
                    onSuffixIconPressed: authCubit.togglePasswordVisibility,
                    obscureText: !authCubit.isPasswordVisible,
                    controller: loginCubit.passwordController,
                    validator: (value) =>
                        authCubit.passwordValidator(value, context),
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
                    textColor: AppColors.kSecondaryColor,
                    backgroundColor: AppColors.kPrimaryColor,
                    onPressed: () {
                      if (loginCubit.formKey.currentState!.validate()) {
                        loginCubit.login(
                            loginRequestModel: LoginRequestModel(
                                email: loginCubit.emailController.text,
                                password: loginCubit.passwordController.text));
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
}

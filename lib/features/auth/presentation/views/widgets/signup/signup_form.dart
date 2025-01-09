import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../../../core/component/widgets/custom_phone_field.dart';
import '../../../../../../core/component/widgets/custom_text_field.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/signup_request_model.dart';
import '../../../controller/auth/auth_cubit.dart';
import '../../../controller/signup/signup_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    final progress = ProgressHUD.of(context);

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          progress?.show();
        } else if (state is SignupError) {
          progress?.dismiss();
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.message,
            ),
          );
        } else if (state is SignupSuccess) {
          progress?.dismiss();
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: state.token,
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Form(
              key: signupCubit.formKey,
              child: Column(
                spacing: 16,
                children: [
                  CustomTextField(
                    labelText: S.of(context).fullName,
                    keyboardType: TextInputType.name,
                    controller: signupCubit.fullNameController,
                    validator: (value) =>
                        authCubit.nicknameValidator(value, context),
                  ),
                  CustomTextField(
                    labelText: S.of(context).email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        authCubit.emailValidator(value, context),
                    controller: signupCubit.emailController,
                  ),
                  CustomTextField(
                    labelText: S.of(context).password,
                    keyboardType: TextInputType.visiblePassword,
                    controller: signupCubit.passwordController,
                    validator: (value) =>
                        authCubit.passwordValidator(value, context),
                    obscureText: !authCubit.isPasswordVisible,
                    suffixIconVisibility: true,
                    onSuffixIconPressed: authCubit.togglePasswordVisibility,
                  ),
                  CustomTextField(
                    labelText: S.of(context).confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    controller: signupCubit.confirmPasswordController,
                    obscureText: !authCubit.isConfirmPasswordVisible,
                    validator: (value) => authCubit.confirmPasswordValidator(
                        value, signupCubit.passwordController.text, context),
                    suffixIconVisibility: true,
                    onSuffixIconPressed:
                        authCubit.toggleConfirmPasswordVisibility,
                  ),
                  CustomPhoneField(
                    labelText: S.of(context).phoneNumber,
                    validator: (value) => authCubit.phoneValidator(
                        value?.completeNumber, context),
                    onChanged: (phone) {
                      signupCubit.phoneController.text = phone.completeNumber;
                    },
                  ),
                  CustomElevatedButton(
                    text: S.of(context).signupButton,
                    textColor: Colors.black,
                    backgroundColor: AppColors.kPrimaryColor,
                    onPressed: () {
                      print(
                          "---------------${signupCubit.phoneController.text.isEmpty} ");
                      if (signupCubit.formKey.currentState!.validate()) {
                        progress?.show();
                        authCubit.resendEmailVerification();
                        signupCubit.signup(
                            signupRequestModel: RegisterRequestModel(
                          email: signupCubit.emailController.text,
                          fullName: signupCubit.fullNameController.text,
                          password: signupCubit.passwordController.text.trim(),
                          phone: signupCubit.phoneController.text,
                        ));
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

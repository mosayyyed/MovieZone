import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../../../core/component/widgets/custom_phone_field.dart';
import '../../../../../../core/component/widgets/custom_text_field.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../data/models/signup_request_model.dart';
import '../../../controller/auth/auth_cubit.dart';
import '../../../controller/signup/signup_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final signupCubit = BlocProvider.of<SignupCubit>(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: signupCubit.formKey,
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(
                labelText: 'Full Name',
                keyboardType: TextInputType.name,
                controller: signupCubit.nicknameController,
                validator: authCubit.nicknameValidator,
              ),
              CustomTextField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: authCubit.emailValidator,
                controller: signupCubit.emailController,
              ),
              CustomTextField(
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                controller: signupCubit.passwordController,
                validator: (value) => authCubit.passwordValidator(value),
                obscureText: !authCubit.isPasswordVisible,
                suffixIconVisibility: true,
                onSuffixIconPressed: authCubit.togglePasswordVisibility,
              ),
              CustomTextField(
                labelText: 'Confirm Password',
                keyboardType: TextInputType.visiblePassword,
                controller: signupCubit.confirmPasswordController,
                obscureText: !authCubit.isConfirmPasswordVisible,
                validator: (value) => authCubit.confirmPasswordValidator(
                    value, signupCubit.passwordController.text),
                suffixIconVisibility: true,
                onSuffixIconPressed: authCubit.toggleConfirmPasswordVisibility,
              ),
              CustomPhoneField(
                labelText: 'Phone Number',
                validator: (value) =>
                    authCubit.phoneValidator(value?.completeNumber),
                onChanged: (phone) {
                  signupCubit.phoneController.text = phone.completeNumber;
                },
              ),
              CustomElevatedButton(
                text: 'Create Account',
                textColor: Colors.black,
                backgroundColor: AppColors.kPrimaryColor,
                onPressed: () {
                  if (signupCubit.formKey.currentState!.validate()) {
                    authCubit.resendEmailVerification();
                    signupCubit.signup(
                        signupRequestModel: RegisterRequestModel(
                      email: signupCubit.emailController.text,
                      fullName: signupCubit.nicknameController.text,
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
  }
}

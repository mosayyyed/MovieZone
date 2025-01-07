import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_reg_exp.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  AuthCubit(this.authRepo) : super(AuthInitial());

  String? nicknameValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).fullNameRequiredError;
    }
    if (value.length < 3) return S.of(context).fullNameTooShortError;
    if (!AppRegExp.isNicknameValid(value)) {
      return S.of(context).fullNameInvalidError;
    }
    return null;
  }

  String? emailValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) return S.of(context).emailRequiredError;
    if (!AppRegExp.isEmailValid(value)) {
      return S.of(context).emailInvalidError;
    }
    return null;
  }

  String? passwordValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordRequiredError;
    }
    if (!AppRegExp.isPasswordValid(value)) {
      return S.of(context).passwordInvalidError;
    }
    return null;
  }

  String? confirmPasswordValidator(
      String? value, String password, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).confirmPasswordRequiredError;
    }
    if (value != password) return S.of(context).passwordsDoNotMatchError;
    return null;
  }

  String? phoneValidator(String? value, BuildContext context) {
    final strippedNumber =
        value?.replaceFirst(RegExp(r'^\+\d{1,3}'), '').trim();

    if (strippedNumber == null || strippedNumber.isEmpty) {
      return S.of(context).phoneNumberRequiredError;
    }

    if (!AppRegExp.isPhoneValid(strippedNumber)) {
      return S.of(context).phoneNumberInvalidError;
    }

    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChanged(isPasswordVisible));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(PasswordVisibilityChanged(isConfirmPasswordVisible));
  }

  Future<void> resendEmailVerification() async {
    emit(AuthLoading());

    final result = await authRepo.getCurrentUser();

    result.fold(
      (failure) => emit(AuthError("Failed to get current user")),
      (currentUser) async {
        if (currentUser != null && !currentUser.emailVerified) {
          await authRepo.verifyEmail();
          emit(AuthSuccess());
        } else if (currentUser == null) {
          emit(AuthError("No user found"));
        } else {
          emit(AuthError("Email is already verified"));
        }
      },
    );
  }

  Stream<bool> emailVerificationStream(FirebaseAuth auth) async* {
    await for (final user in auth.userChanges()) {
      if (user != null) {
        await user.reload();
        bool isEmailVerified = user.emailVerified;

        yield isEmailVerified;
      } else {
        yield false;
      }
    }
  }
}

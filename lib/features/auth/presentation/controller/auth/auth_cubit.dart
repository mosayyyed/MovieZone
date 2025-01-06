import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_reg_exp.dart';
import '../../../data/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  bool isPasswordVisible = false;

  AuthCubit(this.authRepo) : super(AuthInitial());
  String? nicknameValidator(String? value) {
    if (value == null || value.isEmpty) return 'Nickname is required';
    if (value.length < 3) return 'Nickname must be at least 3 characters long';
    if (!AppRegExp.isNicknameValid(value)) {
      return 'Nickname can only contain letters, numbers, and #';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!AppRegExp.isEmailValid(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (!AppRegExp.isPasswordValid(value)) {
      return 'Password must be at least 8 characters long and include uppercase letters, lowercase letters, numbers, and special characters';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    if (!AppRegExp.isPhoneValid(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChanged(isPasswordVisible));
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

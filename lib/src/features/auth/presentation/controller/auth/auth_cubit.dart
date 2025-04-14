import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  AuthCubit(this.authRepo) : super(AuthInitial());


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
    // TODO: Fix send email
    result.fold(
      (failure) => emit(AuthError(failure.message)),
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

  Future<bool> checkEmailVerification() async {
    emit(AuthLoading());

    final result = await authRepo.isEmailVerified();

    return result.fold(
      (failure) {
        emit(AuthError(failure.message));
        return false;
      },
      (isVerified) {
        emit(AuthSuccess());
        return isVerified;
      },
    );
  }
}

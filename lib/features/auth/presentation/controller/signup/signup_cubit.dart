import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/signup_request_model.dart';
import '../../../data/repositories/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  final emailController = TextEditingController();
  final nicknameController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signup({
    required RegisterRequestModel signupRequestModel,
  }) async {
    emit(SignupLoading());
    final response = await authRepo.signUpWithEmailAndPassword(
      email: signupRequestModel.email,
      password: signupRequestModel.password,
    );

    response.fold((failure) {
      emit(
        SignupError(failure.message),
      );
    }, (user) async {
      emit(SignupSuccess(user!.uid));
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    nicknameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}

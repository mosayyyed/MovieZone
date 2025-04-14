import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/auth/data/models/signup_request_model.dart';
import 'package:movie_app/src/features/auth/data/repositories/auth_repo.dart';
import 'package:movie_app/src/features/profile/data/models/user_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
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
      await authRepo.createUser(
        userModel: UserModel(
          token: user!.uid,
          fullName: signupRequestModel.fullName,
          email: signupRequestModel.email,
          phone: signupRequestModel.phone,
        ),
      );

      emit(SignupSuccess(user.uid));
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}

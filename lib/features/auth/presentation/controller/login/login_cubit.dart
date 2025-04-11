import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repo.dart';

import '../../../data/models/login_request_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoading());

    final response = await authRepo.signInWithEmailAndPassword(
        email: loginRequestModel.email, password: loginRequestModel.password);
    response.fold(
      (failure) {
        emit(LoginError(failure.message));
      },
      (user) {
        emit(LoginSuccess(user!.uid));
      },
    );
  }

  Future<void> forgetPassword({required String email}) async {
    emit(LoginLoading());
    final response = await authRepo.forgetPassword(email);
    response.fold(
      (failure) {
        emit(LoginError(failure.message));
      },
      (_) {
        emit(LoginInitial());
      },
    );
  }
}
        
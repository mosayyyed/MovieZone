import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/data/repositories/user_repo.dart';
import 'package:movie_app/features/profile/presentation/controller/cubit/user_cubit_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo _userRepo;

  UserCubit(this._userRepo) : super(UserInitial());

  Future<void> fetchUser() async {
    emit(UserLoading());

    final Either<Failure, UserModel?> result = await _userRepo.getUser();

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) {
        if (user != null) {
          emit(UserLoaded(user));
        } else {
          emit(UserError("المستخدم غير موجود"));
        }
      },
    );
  }
}

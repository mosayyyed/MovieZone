import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/data/repositories/user_repo.dart';
import 'package:movie_app/features/profile/presentation/controller/cubit/user_cubit_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo _userRepo;
  UserModel? user;

  UserCubit(this._userRepo) : super(UserInitial());

  Future<void> getUser() async {
    emit(UserLoading(UserModel.fake()));
    final result = await _userRepo.getUser();
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user!)),
    );
  }

  Future<void> updateUser(UserModel user) async {
    emit(UserLoading(UserModel.fake()));
    final result = await _userRepo.updateUser(user);
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (_) => getUser(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/profile/presentation/controller/cubit/user_cubit_cubit.dart';
import 'package:movie_app/features/profile/presentation/controller/cubit/user_cubit_state.dart';
import 'package:movie_app/features/profile/presentation/views/ui/profile_content.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Skeletonizer(
            enabled: true,
            child: ProfileContent(
              user: state.user,
            ),
          );
        } else if (state is UserLoaded) {
          return ProfileContent(
            user: state.user,
          );
        } else if (state is UserError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }      
      },
    );
  }
}

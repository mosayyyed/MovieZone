import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';

class BookmarksError extends StatelessWidget {
  final String message;

  const BookmarksError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<BookmarkCubit>().loadBookmarks(),
            child: Text(S.of(context).tryAgain),
          ),
        ],
      ),
    );
  }
}

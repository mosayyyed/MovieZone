import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';
import 'package:movie_app/src/features/bookmark/presentation/ui/bookmark_card.dart';
import 'package:movie_app/generated/l10n.dart';

class BookmarksLoading extends StatelessWidget {
  final List<BookmarkModel> fakeBookmarks;

  const BookmarksLoading({super.key, required this.fakeBookmarks});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: fakeBookmarks.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Text(
                S.of(context).today,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            );
          }
          return BookmarkCard(
            bookmark: fakeBookmarks[index - 1],
            genres: [],
          );
        },
      ),
    );
  }
}

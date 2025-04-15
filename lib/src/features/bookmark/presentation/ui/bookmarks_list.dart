import 'package:flutter/material.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_state.dart';
import 'package:movie_app/src/features/bookmark/presentation/ui/bookmark_card.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';

class BookmarksList extends StatelessWidget {
  final BookmarkLoaded state;
  final List<GenreModel> genres;

  const BookmarksList({
    super.key,
    required this.state,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    final items = _buildGroupedList(state, context);

    return ListView.builder(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final item = items[index];
        if (item.type == BookmarkItemType.header) {
          return _buildSectionTitle(item.title!);
        } else {
          final bookmark = item.bookmark!;
          return BookmarkCard(
            bookmark: bookmark,
            genres: genres,
          );
        }
      },
    );
  }

  List<BookmarkSectionItem> _buildGroupedList(
      BookmarkLoaded state, BuildContext context) {
    final List<BookmarkSectionItem> items = [];

    void addGroup(String title, List<BookmarkModel> bookmarks) {
      if (bookmarks.isEmpty) return;
      items.add(BookmarkSectionItem.header(title));
      items.addAll(bookmarks.map(BookmarkSectionItem.item));
    }

    addGroup(S.of(context).today, state.todayBookmarks);
    addGroup(S.of(context).yesterday, state.yesterdayBookmarks);
    addGroup(S.of(context).thisWeek, state.thisWeekBookmarks);
    addGroup(S.of(context).thisMonth, state.thisMonthBookmarks);
    addGroup(S.of(context).lastMonth, state.lastMonthBookmarks);
    addGroup(S.of(context).older, state.olderBookmarks);

    return items;
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: Styles.boldTextStyle18,
      ),
    );
  }
}

enum BookmarkItemType { header, item }

class BookmarkSectionItem {
  final BookmarkItemType type;
  final String? title;
  final BookmarkModel? bookmark;

  BookmarkSectionItem.header(this.title)
      : type = BookmarkItemType.header,
        bookmark = null;

  BookmarkSectionItem.item(this.bookmark)
      : type = BookmarkItemType.item,
        title = null;
}

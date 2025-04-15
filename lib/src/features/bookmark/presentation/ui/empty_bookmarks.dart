import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/src/core/themes/app_assets.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';

class EmptyBookmarks extends StatelessWidget {
  const EmptyBookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.icons.bookmark,
            width: 100,
            height: 100,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).noBookmarkedMovies,
            style: Styles.boldTextStyle18,
          ),
          const SizedBox(height: 4),
          Text(
            S.of(context).addMoviesToBookmarks,
            style: Styles.textStyle16,
          ),
        ],
      ),
    );
  }
}

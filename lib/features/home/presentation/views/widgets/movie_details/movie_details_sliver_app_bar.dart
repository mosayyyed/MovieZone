import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/themes/app_assets.dart';
import '../../../../data/models/movie_details_model.dart';

class MovieDetailsSliverAppBar extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieDetailsSliverAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.icons.share, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.icons.bookmarkAdd,
              color: Colors.white),
        ),
      ],
      leading: IconButton(
        onPressed: () => GoRouter.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        expandedTitleScale: 1.3,
        titlePadding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        stretchModes: const [StretchMode.zoomBackground, StretchMode.fadeTitle],
        background: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: movie.backdropPath,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => const Icon(Icons.error, size: 50),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.secondary.withAlpha(230),
                      Theme.of(context).colorScheme.secondary.withAlpha(150),
                      Theme.of(context).colorScheme.secondary.withAlpha(100),
                      Theme.of(context).colorScheme.secondary.withAlpha(51),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

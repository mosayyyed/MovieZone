import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../screen/movie_details_screen.dart';

class ContinueWatching extends StatelessWidget {
  final List<MovieModel> trendingMovieModel;

  final bool state;
  const ContinueWatching({
    super.key,
    required this.trendingMovieModel,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final List<double> progress = List.generate(
      trendingMovieModel.length,
      (index) => trendingMovieModel[index].voteAverage / 10,
    );
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: Skeletonizer(
          enabled: state,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: trendingMovieModel.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(
                        imageUrl:
                            "$kFullImageUrl${trendingMovieModel[index].backdropPath}",
                        images: trendingMovieModel
                            .map((e) => e.posterPath)
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          fadeInCurve: Curves.linear,
                          imageUrl:
                              "$kFullImageUrl${trendingMovieModel[index].backdropPath}",
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, size: 50),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 150,
                        ),
                        // Semi-transparent overlay
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(8),
                        ),
                        // Controls and Text
                        Positioned.fill(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      trendingMovieModel[index].title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 4,
                                            color: Colors.black45,
                                          ),
                                        ],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: AppColors.kPrimaryColor,
                                  size: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${(progress[index] * 100).toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 2,
                                            color: Colors.black45,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: LinearProgressIndicator(
                                        value: progress[index],
                                        minHeight: 4,
                                        backgroundColor: AppColors.kGreyColor
                                            .withOpacity(0.4),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../screen/movie_details_screen.dart';

class HorizontalList extends StatelessWidget {
  final List<MovieModel> trendingMovieModel;
  const HorizontalList({
    super.key,
    required this.trendingMovieModel,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 270,
        child: Skeletonizer(
          enabled: trendingMovieModel.isEmpty,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: trendingMovieModel.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(
                        imageUrl:
                            "$kFullImageUrl${trendingMovieModel[index].posterPath}",
                        images: trendingMovieModel
                            .map((e) => e.posterPath)
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              "$kFullImageUrl${trendingMovieModel[index].posterPath}",
                              fit: BoxFit.cover,
                              width: 150,
                              height: 200,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        trendingMovieModel[index].title,
                        style: Styles.textStyle14
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded,
                              color: Colors.yellow, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            trendingMovieModel[index].voteAverage.toString(),
                            style: Styles.textStyle12
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "|",
                            style: Styles.textStyle12
                                .copyWith(color: Colors.white70),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            trendingMovieModel[index].id.toString(),
                            style: Styles.textStyle12
                                .copyWith(color: Colors.white70),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
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

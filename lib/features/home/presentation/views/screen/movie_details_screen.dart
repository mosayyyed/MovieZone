import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/movie_details_model.dart';
import '../../controller/MovieVideos/movie_videos_cubit.dart';
import '../../controller/movie_details/movie_details_cubit.dart';
import '../widgets/MovieVideosSection/MovieVideosSection.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final movieDetailsCubit = context.read<MovieDetailsCubit>();
    final movieVideosCubit = context.read<MovieVideosCubit>();
    movieDetailsCubit.fetchMovieDetails(movieId);
    movieVideosCubit.fetchMovieVideos(movieId);

    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return _buildSkeletonLoader();
          } else if (state is MovieDetailsError) {
            return const Center(child: Text("حدث خطأ في تحميل البيانات"));
          } else if (state is MovieDetailsSuccess) {
            final movie = state.movieDetailsModel;
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _buildSliverAppBar(context, movie),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitleRow(movie),
                          const SizedBox(height: 4),
                          if (movie.tagLine.isNotEmpty) ...[
                            Text(
                              movie.tagLine,
                              style: Styles.textStyle14.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                          const SizedBox(height: 8),
                          _buildGenres(movie),
                          _buildSectionTitle("الوصف", movie),
                          if (movie.overview.isNotEmpty) ...[
                            ReadMoreText(
                              movie.overview,
                              trimLines: 3,
                              trimMode: TrimMode.Line,
                              colorClickableText: AppColors.kPrimaryColor,
                              style: Styles.textStyle16.copyWith(fontSize: 16),
                              lessStyle: Styles.textStyle16.copyWith(
                                fontSize: 16,
                                color: AppColors.kPrimaryColor.withAlpha(200),
                              ),
                              trimCollapsedText: 'المزيد',
                              trimExpandedText: ' أقل',
                              moreStyle: Styles.textStyle16.copyWith(
                                fontSize: 16,
                                color: AppColors.kPrimaryColor.withAlpha(200),
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                          _buildSectionTitle("تريلرات"),
                          BlocBuilder<MovieVideosCubit, MovieVideosState>(
                            builder: (context, state) {
                              if (state is MovieVideosSuccess) {
                                return MovieVideosSection(
                                    videos: movieVideosCubit.videos);
                              }
                              return const SizedBox();
                            },
                          ),
                          const SizedBox(height: 8),
                          _buildSectionTitle("طاقم العمل"),
                          HorizontalScrollableList(movie: movie),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildSkeletonLoader() {
    return Skeletonizer(
      enabled: true,
      containersColor: Colors.black12,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: Colors.grey.shade300,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(6, (index) => _buildSkeletonBox()),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 20,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, movie) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share_rounded, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_add_rounded, color: Colors.white),
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
      backgroundColor: AppColors.kPrimaryColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        expandedTitleScale: 1.3,
        titlePadding: const EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: 16,
        ),
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
                      AppColors.kSecondaryColor,
                      AppColors.kSecondaryColor.withAlpha(230),
                      AppColors.kSecondaryColor.withAlpha(150),
                      AppColors.kSecondaryColor.withAlpha(100),
                      AppColors.kSecondaryColor.withAlpha(51),
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

  Widget _buildTitleRow(MovieDetailsModel movie) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          movie.title,
          style: Styles.textStyle22.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(width: 8),
        Text(
          '(${DateTime.parse(movie.releaseDate).year.toString()})',
          style: Styles.textStyle22.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildGenres(MovieDetailsModel movie) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: movie.genres.map((genre) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor.withAlpha(150),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          child: Text(
            genre.name,
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, [MovieDetailsModel? movie]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.textStyle22.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Visibility(
            visible: movie != null,
            child: Row(
              children: [
                Text(
                  movie?.voteAverage.toStringAsFixed(1).toString() ?? '',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 4),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: (movie?.voteAverage ?? 0) / 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star_rounded,
                    color: AppColors.kPrimaryColor,
                  ),
                  onRatingUpdate: (double value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalScrollableList extends StatelessWidget {
  final MovieDetailsModel movie;
  const HorizontalScrollableList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الشركات الإنتاجية",
          style: Styles.textStyle22.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 1,
          ),
          itemCount: movie.productionCompanies.length,
          itemBuilder: (context, index) {
            final company = movie.productionCompanies[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Card(
                elevation: 0,
                color: AppColors.kPrimaryColor.withAlpha(150),
                child: Container(
                  padding: const EdgeInsets.all(kBorderRadius),
                  child: CachedNetworkImage(
                    imageUrl: company.logoPath,
                    fit: BoxFit.contain,
                    errorWidget: (_, __, ___) => const SizedBox(),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

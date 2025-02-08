import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_styles.dart';
import '../../../data/models/movie_details_model.dart';
import '../../controller/movie_details/movie_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final movieDetailsCubit = context.read<MovieDetailsCubit>();
    movieDetailsCubit.fetchMovieDetails(movieId);
    movieDetailsCubit.fetchMovieVideos(movieId);

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
                          _buildSectionTitle("نظرة عامة"),
                          Text(
                            movie.overview,
                            style: Styles.textStyle16.copyWith(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow('العنوان الأصلي', movie.originalTitle),
                          _buildInfoRow('الشعار', movie.tagLine),
                          _buildInfoRow('تاريخ الإصدار', movie.releaseDate),
                          _buildInfoRow('التقييم', '${movie.voteAverage}/10'),
                          _buildInfoRow('عدد الأصوات', '${movie.voteCount}'),
                          _buildInfoRow('شعبية', '${movie.popularity}'),
                          _buildInfoRow('الإيرادات', '${movie.revenue}'),
                          const SizedBox(height: 16),
                          // عرض الأنواع (Genres)
                          _buildSectionTitle("الأنواع"),
                          Text(
                            movie.genres.map((genre) => genre.name).join(', '),
                            style: Styles.textStyle16.copyWith(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 16),
                          // عرض الشركات الإنتاجية (Production Companies)
                          HorizontalScrollableList(movie: movie),
                          const SizedBox(height: 16),
                          _buildWatchTrailerButton(),
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
      expandedHeight: MediaQuery.of(context).size.height * 0.25,
      elevation: 0,
      automaticallyImplyLeading: false,
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
        stretchModes: const [StretchMode.zoomBackground, StretchMode.fadeTitle],
        background: CachedNetworkImage(
          imageUrl: movie.backdropPath,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => const Icon(Icons.error, size: 50),
        ),
        title: Text(
          movie.title,
          style: Styles.textStyle22
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title,
          style: Styles.textStyle22
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text('$label: ',
              style: Styles.textStyle16
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(
            child: Text(value,
                style: Styles.textStyle16.copyWith(fontSize: 16),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  Widget _buildWatchTrailerButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        'مشاهدة المقطع الدعائي',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(0),
            itemCount: movie.productionCompanies.length,
            itemBuilder: (context, index) {
              final company = movie.productionCompanies[index];
              return Container(
                margin: const EdgeInsets.only(right: 16), // المسافة بين الكروت
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Card(
                    elevation: 6,
                    color: Colors.grey.shade800,
                    child: Container(
                      width: 120,
                      height: 120,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (company.logoPath.isNotEmpty)
                            CachedNetworkImage(
                              imageUrl: company.logoPath,
                              height: 50,
                              width: 80,
                              fit: BoxFit.contain,
                              errorWidget: (_, __, ___) =>
                                  const Icon(Icons.error, size: 30),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../core/utils/escape_parent_padding.dart';
import '../../../../../../core/utils/showVideoDiolog.dart';
import '../../../../data/models/movie_videos_model.dart';
import '../../../controller/MovieVideos/movie_videos_cubit.dart';

class MovieVideosSection extends StatelessWidget {
  const MovieVideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieVideosCubit, MovieVideosState>(
      builder: (context, state) {
        if (state is MovieVideosSuccess) {
          final officialVideos = state.movieVideosList
              .where((video) => video.official && video.type == "Trailer")
              .toList();

          if (officialVideos.isEmpty) {
            return const SizedBox(
              height: 150,
              child: Center(
                child: Text(
                  "لا يوجد فيديوهات",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            );
          }
          return _buildVideoCard(context, officialVideos);
        } else if (state is MovieVideosLoading) {
          return Skeletonizer(
            enabled: true,
            containersColor: Colors.black12,
            child: SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 140,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return const SizedBox(
            height: 150,
            child: Center(
              child: Text(
                "حدث خطأ في تحميل البيانات",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildVideoCard(
      BuildContext context, List<MovieVideosModel> officialVideos) {
    return EscapeParentPadding(
      height: 160,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: officialVideos.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final video = officialVideos[index];
          return GestureDetector(
            onTap: () => showVideoDialog(context,
                videoKey: video.key, videoName: video.name),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://img.youtube.com/vi/${video.key}/hqdefault.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: const Center(
                      child: Icon(Icons.play_arrow_rounded,
                          color: AppColors.kPrimaryColor, size: 50),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Text(
                      video.name,
                      style: Styles.textStyle16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

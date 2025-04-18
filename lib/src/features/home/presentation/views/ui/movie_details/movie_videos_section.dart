import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/ui/blurred_play_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../core/utils/escape_parent_padding.dart';
import '../../../../../../core/utils/show_video_diolog.dart';
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
            return SizedBox(
              height: 150.h,
              child: Center(
                child: Text(
                  "لا يوجد فيديوهات",
                  style: Styles.textStyle16.copyWith(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
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
              height: 160.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Container(
                      width: 140.w,
                      height: 160.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 150.h,
            child: Center(
              child: Text(
                "حدث خطأ في تحميل البيانات",
                style: Styles.textStyle16.copyWith(
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
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
                  Positioned.fill(
                    child: BlurredPlayButton(
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

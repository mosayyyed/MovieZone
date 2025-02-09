import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../data/models/movie_videos_model.dart';

class MovieVideosSection extends StatelessWidget {
  final List<MovieVideosModel> videos;

  const MovieVideosSection({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    final officialVideos = videos
        .where((video) => video.official && video.type == "Trailer")
        .toList();
    if (officialVideos.isEmpty) {
      return const Center(child: Text("لا توجد تريلرات متاحة"));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            itemCount: officialVideos.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final video = officialVideos[index];
              return _buildVideoCard(context, video);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVideoCard(BuildContext context, MovieVideosModel video) {
    return GestureDetector(
      onTap: () => _showVideoDialog(context, video.key),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Container(
              width: 250, // العرض
              height: 140, // الطول
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
              width: 250,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.3),
              ),
              child: const Center(
                child: Icon(Icons.play_arrow_rounded,
                    color: AppColors.kPrimaryColor, size: 45),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Text(
                video.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black,
                      offset: Offset(1, 1),
                    )
                  ],
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
  }

  void _showVideoDialog(BuildContext context, String videoKey) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
                progressColors: ProgressBarColors(
                  playedColor: AppColors.kPrimaryColor,
                  handleColor: AppColors.kPrimaryColor,
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.grey,
                ),
                thumbnail: Image.network(
                  "https://img.youtube.com/vi/$videoKey/hqdefault.jpg",
                  fit: BoxFit.cover,
                ),
                progressIndicatorColor: AppColors.kPrimaryColor,
                liveUIColor: AppColors.kPrimaryColor,
                controller: YoutubePlayerController(
                  initialVideoId: videoKey,
                  flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
                ),
                showVideoProgressIndicator: false,
              ),
            ),
          ),
        );
      },
    );
  }
}

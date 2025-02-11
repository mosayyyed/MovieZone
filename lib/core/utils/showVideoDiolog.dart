import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../core/themes/app_colors.dart';
import 'constants.dart';

void showVideoDialog(BuildContext context,
    {required String videoKey, required String videoName}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                aspectRatio: 16 / 9,
                onEnded: (metaData) {
                  Navigator.of(context).pop();
                },
                topActions: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      videoName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                      isExpanded: true,
                      colors: ProgressBarColors(
                          playedColor: AppColors.kPrimaryColor,
                          backgroundColor: Colors.grey.withAlpha(100),
                          bufferedColor: Colors.grey.withAlpha(150),
                          handleColor: AppColors.kPrimaryColor)),
                ],
                progressColors: ProgressBarColors(
                  playedColor: AppColors.kPrimaryColor,
                  handleColor: AppColors.kPrimaryColor,
                  bufferedColor: Colors.grey.withAlpha(150),
                  backgroundColor: Colors.grey.withAlpha(100),
                ),
                progressIndicatorColor: AppColors.kPrimaryColor,
                liveUIColor: AppColors.kPrimaryColor,
                controller: YoutubePlayerController(
                  initialVideoId: videoKey,
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: false,
              ),
            ),
          ),
        ),
      );
    },
  );
}

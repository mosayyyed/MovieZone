// import 'package:flutter/material.dart';
//
// import '../../../../../../core/themes/app_colors.dart';
// import '../../../../../../core/themes/app_styles.dart';
// import '../../../../../../core/utils/showVideoDiolog.dart';
// import '../../../../data/models/movie_videos_model.dart';
//
// class MovieVideosSection extends StatelessWidget {
//   final List<MovieVideosModel> videos;
//
//   const MovieVideosSection({super.key, required this.videos});
//
//   @override
//   Widget build(BuildContext context) {
//     final officialVideos = videos
//         .where((video) => video.official && video.type == "Trailer")
//         .toList();
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 160,
//           child: ListView.separated(
//             physics: BouncingScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 0),
//             itemCount: officialVideos.length,
//             separatorBuilder: (context, index) => const SizedBox(width: 12),
//             itemBuilder: (context, index) {
//               final video = officialVideos[index];
//               return _buildVideoCard(context, video);
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoCard(BuildContext context, MovieVideosModel video) {
//     return GestureDetector(
//       onTap: () =>
//           showVideoDialog(context, videoKey: video.key, videoName: video.name),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: Stack(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               height: 160,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       "https://img.youtube.com/vi/${video.key}/hqdefault.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               height: 160,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.black.withOpacity(0.3),
//               ),
//               child: const Center(
//                 child: Icon(Icons.play_arrow_rounded,
//                     color: AppColors.kPrimaryColor, size: 50),
//               ),
//             ),
//             Positioned(
//               top: 8,
//               right: 8,
//               child: Text(
//                 video.name,
//                 style: Styles.textStyle16.copyWith(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

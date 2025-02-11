import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/themes/app_colors.dart';
import 'banner_action_buttons.dart';
import 'gradient_overlay.dart';

class SkeletonizerLoadingStack extends StatelessWidget {
  const SkeletonizerLoadingStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Stack(
        children: [
          GradientOverlay(),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "الرائجة اليوم".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "-------------",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "---------",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 16),
                BannerActionButtons(movieId: 0),
                const SizedBox(height: 16),
                SmoothPageIndicator(
                  controller: PageController(),
                  count: 10,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.white.withOpacity(0.5),
                    activeDotColor: AppColors.kPrimaryColor,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/src/core/themes/app_assets.dart';

class BlurredPlayButton extends StatelessWidget {
  final double height;
  final double width;
  const BlurredPlayButton({
    super.key,
    this.height = 40,
    this.width = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        SvgPicture.asset(
          AppAssets.icons.playArrow,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary, BlendMode.srcIn),
          width: 30,
        ),
      ],
    );
  }
}

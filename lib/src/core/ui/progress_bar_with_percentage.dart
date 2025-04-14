import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/themes/app_values.dart';

class ProgressBarWithPercentage extends StatelessWidget {
  const ProgressBarWithPercentage({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p4),
          child: Text(
            '${(progress * 100).toStringAsFixed(0)}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final fullWidth = constraints.maxWidth;
              final progressWidth = fullWidth * progress.clamp(0.0, 1.0);

              return Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      height: 4,
                      width: fullWidth,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Container(
                    height: 4,
                    width: progressWidth,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

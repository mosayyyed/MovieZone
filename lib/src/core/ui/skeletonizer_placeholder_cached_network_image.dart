import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerPlaceholderCachedNetworkImage extends StatelessWidget {
  final double? width;
  final double? height;

  const SkeletonizerPlaceholderCachedNetworkImage({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
    );
  }
}

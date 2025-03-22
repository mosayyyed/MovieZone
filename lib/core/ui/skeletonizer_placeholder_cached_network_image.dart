import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerPlaceholderCachedNetworkImage extends StatelessWidget {
  const SkeletonizerPlaceholderCachedNetworkImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        ));
  }
}


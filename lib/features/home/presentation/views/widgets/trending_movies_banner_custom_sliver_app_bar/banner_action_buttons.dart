import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/themes/app_assets.dart';

class BannerActionButtons extends StatelessWidget {
  const BannerActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.bookmarkAdd,
            color: Colors.white,
            width: 20,
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          icon: SvgPicture.asset(
            AppAssets.icons.playArrow,
            color: Colors.black,
            width: 20,
          ),
          label: const Text(
            "بدء المشاهدة",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.moreHorizontalCircle,
            color: Colors.white,
            width: 20,
          ),
        ),
      ],
    );
  }
}

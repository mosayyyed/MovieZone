import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/themes/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.notification,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.download,
            color: Colors.white,
            width: 28,
          ),
        ),
      ],
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          backgroundImage: const AssetImage("assets/avatar.png"),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

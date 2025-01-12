import 'package:flutter/material.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_styles.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSection({
    super.key,
    required this.title,
    this.automaticallyImplyLeading = false,
  });

  final String title;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kSecondaryColor,
      scrolledUnderElevation: 10,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
      title: Text(title, style: Styles.textStyle20),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(60);
  }
}

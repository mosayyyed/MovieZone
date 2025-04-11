import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/themes/app_values.dart';
import 'package:movie_app/core/ui/my_single_child_scroll_view.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/skip_button.dart';
import 'package:movie_app/features/profile/presentation/views/ui/profile_header.dart';
import 'package:movie_app/features/profile/presentation/views/widgets/appearance_section.dart';
import 'package:movie_app/features/profile/presentation/views/widgets/language_section.dart';
import 'package:movie_app/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:movie_app/features/profile/presentation/views/widgets/notifications_section.dart';
import 'package:movie_app/features/profile/presentation/views/widgets/settings_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: MySingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight * 2),
            const ProfileHeader(),
            const SizedBox(height: 20),
            const SettingsSection(),
            const AppearanceSection(),
            const NotificationsSection(),
            const LanguageSection(),
            const SizedBox(height: 50),
            const LogoutButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: SkipButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
          hasBorderSide: true,
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/src/core/ui/arrow_back_app_bar.dart';
import 'package:movie_app/src/core/ui/my_single_child_scroll_view.dart';
import 'package:movie_app/src/features/profile/presentation/views/ui/profile_header.dart';
import 'package:movie_app/src/features/profile/presentation/views/ui/appearance_section.dart';
import 'package:movie_app/src/features/profile/presentation/views/ui/language_section.dart';
import 'package:movie_app/src/features/profile/presentation/views/ui/logout_button.dart';
import 'package:movie_app/src/features/profile/presentation/views/ui/notifications_section.dart';
import 'package:movie_app/src/features/profile/presentation/views/ui/settings_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const ArrowBackAppBar(),
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
}

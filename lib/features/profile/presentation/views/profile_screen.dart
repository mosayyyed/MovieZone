import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/themes/theme_controller.dart';
import 'package:movie_app/core/ui/custom_elevated_button.dart';
import 'package:movie_app/core/ui/my_single_child_scroll_view.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/skip_button.dart';
import 'package:movie_app/features/profile/presentation/views/ui/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SkipButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: theme.colorScheme.onSurface,
              size: 22,
            ),
            hasBorderSide: true,
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
      ),
      body: MySingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kToolbarHeight * 2),
            ProfileHeader(),
            const SizedBox(height: 20),
            _buildSectionTitle("الإعدادات"),
            const SizedBox(height: 10),
            _buildSwitchTile(
              context,
              "الواي فاي فقط",
              false,
              onChanged: (p0) {},
            ),
            const SizedBox(height: 10),
            _buildSwitchTile(
              context,
              "الوضع المظلم",
              context.read<ThemeCubit>().state is ThemeChanged &&
                  (context.read<ThemeCubit>().state as ThemeChanged)
                          .themeMode ==
                      ThemeMode.dark,
              onChanged: (newValue) {
                context.read<ThemeCubit>().toggleTheme(
                      newValue ? ThemeMode.dark : ThemeMode.light,
                    );
              },
              isDarkMode: true,
            ),
            const SizedBox(height: 10),
            _buildOptionTile(
              "المظهر",
              context,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("المظهر"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("إلغاء"),
                          ),
                        ],
                      );
                    });
              },
            ),
            const SizedBox(height: 10),
            _buildOptionTile("الربط بشاشة", context),
            const SizedBox(height: 10),
            _buildOptionTile("الدقة الإفتراضية", context),
            const SizedBox(height: 20),
            _buildSectionTitle("لغة التطبيق"),
            const SizedBox(height: 10),
            _buildSelectableTile(
              "العربية",
              context,
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("الإشعارات"),
            const SizedBox(height: 10),
            _buildSwitchTile(
              context,
              "السماح بالإشعارات",
              true,
              onChanged: (p0) {},
            ),
            const SizedBox(height: 50),
            CustomElevatedButton(
              text: "تسجيل الخروج",
              backgroundColor: theme.colorScheme.error,
              textColor: theme.colorScheme.onError,
              onPressed: () {
                FirebaseAuth.instance.signOut();
                GoRouter.of(context).go(AppRoutes.kLoginRoute);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _buildSelectableTile(String title, BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)),
    );
  }

  Widget _buildSwitchTile(BuildContext context, String title, bool value,
      {void Function(bool)? onChanged, bool isDarkMode = false}) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      tileColor: Theme.of(context).colorScheme.surface,
      activeColor: Theme.of(context).colorScheme.primary,
      secondary: isDarkMode ? const Icon(Icons.dark_mode) : null,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)),
    );
  }

  Widget _buildOptionTile(String title, BuildContext context,
      {void Function()? onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)),
    );
  }
}

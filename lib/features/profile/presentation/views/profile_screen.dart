import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/controllers/locale_controller.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/themes/app_values.dart';
import 'package:movie_app/core/controllers/theme_controller.dart';
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
      appBar: _buildAppBar(context),
      body: MySingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight * 2),
            const ProfileHeader(),
            const SizedBox(height: 20),
            buildSettingsSection(context),
            buildAppearanceSection(context),
            buildLanguageSection(context),
            buildNotificationsSection(context),
            const SizedBox(height: 50),
            _buildLogoutButton(context, theme),
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
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SkipButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
          hasBorderSide: true,
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
    );
  }

  Widget buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("الإعدادات"),
        const SizedBox(height: 10),
        _buildSwitchTile(context, "الواي فاي فقط", false, onChanged: (p0) {}),
        const SizedBox(height: 10),
        _buildSwitchTile(
          context,
          "الوضع المظلم",
          context.read<ThemeCubit>().state == ThemeMode.dark,
          onChanged: (newValue) {
            context.read<ThemeCubit>().toggleTheme(
                  newValue ? ThemeMode.dark : ThemeMode.light,
                );
          },
          isDarkMode: true,
        ),
        const SizedBox(height: 10),
        _buildOptionTile("الربط بشاشة", context, onTap: () {}),
        const SizedBox(height: 10),
        _buildOptionTile("الدقة الإفتراضية", context, onTap: () {}),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildLanguageSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("لغة التطبيق"),
        const SizedBox(height: 10),
        _buildOptionTile(
          AppConstants.languages.supportedLanguages.entries
              .firstWhere(
                  (entry) => entry.value == context.read<LocaleCubit>().state)
              .key,
          context,
          onTap: () => _showLanguageSelectionSheet(context),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildNotificationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("الإشعارات"),
        const SizedBox(height: 10),
        _buildSwitchTile(context, "السماح بالإشعارات", true,
            onChanged: (p0) {}),
      ],
    );
  }

  void _showLanguageSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s12)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اختر اللغة",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                  const SizedBox(height: 12),
                  ...AppConstants.languages.supportedLanguages.entries
                      .map((entry) {
                    return RadioListTile<Locale>(
                      title:
                          Text(entry.key, style: const TextStyle(fontSize: 18)),
                      value: entry.value,
                      groupValue: locale,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (Locale? newLocale) {
                        if (newLocale != null) {
                          context
                              .read<LocaleCubit>()
                              .changeLanguage(newLocale.languageCode);
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  }),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton(BuildContext context, ThemeData theme) {
    return CustomElevatedButton(
      text: "تسجيل الخروج",
      backgroundColor: theme.colorScheme.error,
      textColor: theme.colorScheme.onError,
      onPressed: () {
        FirebaseAuth.instance.signOut();
        GoRouter.of(context).go(AppRoutes.kLoginRoute);
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _buildOptionTile(String title, BuildContext context,
      {void Function()? onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
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
          borderRadius: BorderRadius.circular(AppSize.s12)),
    );
  }

  Widget buildAppearanceSection(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("المظهر"),
        const SizedBox(height: 20),
        _buildThemeModeSelector(context, themeCubit),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildThemeModeSelector(BuildContext context, ThemeCubit themeCubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildThemeModeOption(
            context, themeCubit, ThemeMode.light, "فاتح", Icons.light_mode),
        _buildThemeModeOption(
            context, themeCubit, ThemeMode.dark, "داكن", Icons.dark_mode),
        _buildThemeModeOption(context, themeCubit, ThemeMode.system, "تلقائي",
            Icons.phone_android),
      ],
    );
  }

  Widget _buildThemeModeOption(BuildContext context, ThemeCubit themeCubit,
      ThemeMode mode, String label, IconData icon) {
    final isSelected = themeCubit.state == mode;
    return GestureDetector(
      onTap: () => themeCubit.toggleTheme(mode),
      child: Column(
        children: [
          Icon(icon,
              size: 30,
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey),
          Text(label,
              style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.grey)),
        ],
      ),
    );
  }
}

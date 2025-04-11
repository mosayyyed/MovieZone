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
import 'package:movie_app/core/utils/country_code_to_flag.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/skip_button.dart';
import 'package:movie_app/generated/l10n.dart';
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
            buildNotificationsSection(context),
            buildLanguageSection(context),
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
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
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
        _buildSectionTitle(S.of(context).settings),
        const SizedBox(height: 10),
        _buildSwitchTile(context, S.of(context).wifiOnly, false,
            onChanged: (p0) {}),
        const SizedBox(height: 10),
        _buildSwitchTile(
          context,
          S.of(context).darkMode,
          context.read<ThemeCubit>().state == ThemeMode.dark,
          onChanged: (newValue) {
            context.read<ThemeCubit>().toggleTheme(
                  newValue ? ThemeMode.dark : ThemeMode.light,
                );
          },
          isDarkMode: true,
        ),
        const SizedBox(height: 10),
        _buildOptionTile(S.of(context).connectToTV, context, onTap: () {}),
        const SizedBox(height: 10),
        _buildOptionTile(S.of(context).defultQuality, context, onTap: () {}),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildLanguageSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        _buildSectionTitle(S.of(context).appLanguage),
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
        _buildSectionTitle(S.of(context).notifications),
        const SizedBox(height: 10),
        _buildSwitchTile(context, S.of(context).allowNotifications, true,
            onChanged: (p0) {}),
      ],
    );
  }

  void _showLanguageSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s12)),
      ),
      builder: (context) {
        return MySingleChildScrollView(
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).chooseLanguage,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...AppConstants.languages.supportedLanguages.entries
                      .map((entry) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 4),
                      onTap: () {
                        context
                            .read<LocaleCubit>()
                            .changeLanguage(entry.value.languageCode);
                        Navigator.of(context).pop();
                      },
                      leading: Text(
                        getFlagEmoji(entry.value.languageCode),
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(
                        entry.key,
                        style: const TextStyle(fontSize: 18),
                      ),
                      trailing: Radio<Locale>(
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
                      ),
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
      text: S.of(context).logout,
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
        _buildSectionTitle(S.of(context).appearance),
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
        _buildThemeModeOption(context, themeCubit, ThemeMode.light,
            S.of(context).lightAppearance, Icons.light_mode),
        _buildThemeModeOption(context, themeCubit, ThemeMode.dark,
            S.of(context).darkAppearance, Icons.dark_mode),
        _buildThemeModeOption(context, themeCubit, ThemeMode.system,
            S.of(context).autoAppearance, Icons.phone_android),
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

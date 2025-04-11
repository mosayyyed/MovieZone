import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/controllers/theme_controller.dart';
import 'package:movie_app/core/themes/app_values.dart';
import 'package:movie_app/generated/l10n.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
}

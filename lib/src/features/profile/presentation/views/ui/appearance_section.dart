import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/controllers/theme_controller.dart';
import 'package:movie_app/generated/l10n.dart';

class AppearanceSection extends StatelessWidget {
  const AppearanceSection({super.key});

  @override
  Widget build(BuildContext context) {
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

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _buildThemeModeSelector(BuildContext context, ThemeCubit themeCubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildThemeModeOption(
          context,
          themeCubit,
          ThemeMode.light,
          S.of(context).lightAppearance,
          Icons.light_mode,
        ),
        _buildThemeModeOption(
          context,
          themeCubit,
          ThemeMode.dark,
          S.of(context).darkAppearance,
          Icons.dark_mode,
        ),
        _buildThemeModeOption(
          context,
          themeCubit,
          ThemeMode.system,
          S.of(context).autoAppearance,
          Icons.phone_android,
        ),
      ],
    );
  }

  Widget _buildThemeModeOption(
    BuildContext context,
    ThemeCubit themeCubit,
    ThemeMode mode,
    String label,
    IconData icon,
  ) {
    final isSelected = themeCubit.state == mode;
    return GestureDetector(
      onTap: () => themeCubit.toggleTheme(mode),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

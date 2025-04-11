import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/controllers/locale_controller.dart';
import 'package:movie_app/core/themes/app_values.dart';
import 'package:movie_app/core/ui/my_single_child_scroll_view.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/country_code_to_flag.dart';
import 'package:movie_app/generated/l10n.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
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

  void _showLanguageSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
        minHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s12)),
      ),
      builder: (context) {
        return MySingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
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
}

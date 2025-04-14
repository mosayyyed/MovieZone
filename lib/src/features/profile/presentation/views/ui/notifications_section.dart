import 'package:flutter/material.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/generated/l10n.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
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

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _buildSwitchTile(BuildContext context, String title, bool value,
      {void Function(bool)? onChanged}) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      tileColor: Theme.of(context).colorScheme.surface,
      activeColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
    );
  }
}

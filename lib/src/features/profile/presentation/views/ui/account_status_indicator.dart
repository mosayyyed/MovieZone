import 'package:flutter/material.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/generated/l10n.dart';

class AccountStatusIndicator extends StatelessWidget {
  const AccountStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle,
                color: Theme.of(context).colorScheme.primary, size: 14),
            const SizedBox(width: 4),
            Text(
              S.of(context).accountStatus,
              style: Styles.textStyle12.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

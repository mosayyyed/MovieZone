import 'package:flutter/material.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../generated/l10n.dart';

class VerificationInfoText extends StatelessWidget {
  const VerificationInfoText({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: S.of(context).verificationInfoText1,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontSize: 16, color: Colors.white),
        children: [
          TextSpan(
            text: "\n$email. \n",
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: S.of(context).verificationInfoText2,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

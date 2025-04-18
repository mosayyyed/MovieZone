import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../../generated/l10n.dart';

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
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 16.sp, color: Theme.of(context).colorScheme.onSurface),
        children: [
          TextSpan(
            text: "\n$email. \n",
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          TextSpan(
            text: S.of(context).verificationInfoText2,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}

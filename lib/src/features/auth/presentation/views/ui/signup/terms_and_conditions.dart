import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../../generated/l10n.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: S.of(context).termsAndConditionsText1,
            style: Styles.textStyle12.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: 'Cairo',
              fontSize: 12.sp,
            ),
          ),
          TextSpan(
            text: S.of(context).termsAndConditionsText2,
            style: Styles.textStyle12.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              fontSize: 12.sp,
            ),
          ),
          TextSpan(
            text: S.of(context).termsAndConditionsText3,
            style: Styles.textStyle12.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: 'Cairo',
              fontSize: 12.sp,
            ),
          ),
          TextSpan(
            text: S.of(context).termsAndConditionsText4,
            style: Styles.textStyle12.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/themes/app_styles.dart';

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
            text: 'By logging. your agree to our and ',
            style: Styles.textStyle12.copyWith(
              color: Colors.white,
              fontFamily: 'Montserrat',
            ),
          ),
          TextSpan(
            text: 'Terms & Conditions',
            style: Styles.textStyle12.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          TextSpan(
            text: ' and ',
            style: Styles.textStyle12.copyWith(
              color: Colors.white,
              fontFamily: 'Montserrat',
            ),
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: Styles.textStyle12.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}

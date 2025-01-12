import 'package:flutter/material.dart';

import '../../../../../../core/component/widgets/my_single_child_scroll_view.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../generated/l10n.dart';
import 'email_verification_stream_builder.dart';
import 'verification_info_text.dart';

class EmailVerificationBody extends StatelessWidget {
  const EmailVerificationBody({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return MySingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            S.of(context).verificationEmail,
            style: Styles.textStyle32.copyWith(
                color: AppColors.kPrimaryColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          VerificationInfoText(email: email),
          const SizedBox(height: 50),
          Text(
            S.of(context).dontReceive,
            style: Styles.textStyle16,
          ),
          const SizedBox(height: 20),
          const EmailVerificationStreamBuilder(),
        ],
      ),
    );
  }
}

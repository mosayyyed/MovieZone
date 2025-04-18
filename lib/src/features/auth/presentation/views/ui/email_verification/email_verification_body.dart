import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/ui/my_single_child_scroll_view.dart';
import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../../generated/l10n.dart';
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
                color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20.h),
          VerificationInfoText(email: email),
          SizedBox(height: 50.h),
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

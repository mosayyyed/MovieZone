import 'package:flutter/material.dart';

import '../signup_with_social_button.dart';

class SignupWithSocialRow extends StatelessWidget {
  const SignupWithSocialRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        SignupWithSocialButton(
          type: SocialButtonType.facebook,
        ),
        SignupWithSocialButton(
          type: SocialButtonType.apple,
          onPressed: () {},
        ),
        SignupWithSocialButton(
          type: SocialButtonType.google,
        )
      ],
    );
  }
}

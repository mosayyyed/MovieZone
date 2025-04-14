import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imageAsset;

  const OnboardingPage({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imageAsset,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withAlpha(0),
                Colors.black.withAlpha(51),
                Colors.black.withAlpha(127),
                Colors.black.withAlpha(204),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

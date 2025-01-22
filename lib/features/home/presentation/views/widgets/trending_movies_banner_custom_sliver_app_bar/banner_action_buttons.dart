import 'package:flutter/material.dart';

class BannerActionButtons extends StatelessWidget {
  const BannerActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_outline_rounded, color: Colors.white),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          icon: const Icon(Icons.play_arrow, color: Colors.black),
          label: const Text(
            "بدء المشاهدة",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: Colors.white),
        ),
      ],
    );
  }
}

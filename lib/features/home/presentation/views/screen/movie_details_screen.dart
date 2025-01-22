import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../onboarding/presentation/widgets/skip_button.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final List<String> images;

  const MovieDetailsScreen({
    super.key,
    required this.imageUrl,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SkipButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.kGreyColor,
                  size: 22,
                ),
                hasBorderSide: true,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
            const Text(
              'بابا المجال',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                // صورة الخلفية
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                // تأثير التمويه
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // محتوى الشاشة
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kToolbarHeight + 40),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // صورة الفيلم في منتصف الشاشة
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              imageUrl,
                              width: 200,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // عنوان الفيلم
                        const Text(
                          'عنوان الفيلم',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // التصنيفات والتقييم
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '9.1',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'أكشن • دراما • خيال علمي',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // معلومات إضافية
                        const Text(
                          'المخرج: اسم المخرج\nالممثلون: ممثل 1، ممثل 2، ممثل 3\nسنة الإصدار: 2023',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // وصف الفيلم
                        const Text(
                          'هذا هو وصف الفيلم الذي يحتوي على تفاصيل مثيرة للاهتمام حول القصة، الشخصيات، والممثلين.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // أزرار التفاعل
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow_rounded),
                              label: const Text('مشاهدة الآن'),
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side:
                                    BorderSide(color: AppColors.kPrimaryColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_outline_rounded),
                              label: const Text('إضافة للمفضلة'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // أفلام مشابهة
                        const Text(
                          'أفلام مشابهة',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              return AspectRatio(
                                aspectRatio: 2 / 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

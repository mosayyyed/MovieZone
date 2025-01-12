import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            elevation: 0,
            scrolledUnderElevation: 0,
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.kSecondaryColor,
            title: const Text("الرئيسية"),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                backgroundImage: AssetImage("assets/avatar.png"),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.blurBackground],
              titlePadding: const EdgeInsets.all(0),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://m.media-amazon.com/images/M/MV5BOTkyZjJiZmQtM2I1Zi00MjhkLWIwZWItNTUzMDQ5NzAyMmZiXkEyXkFqcGc@._V1_.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.kSecondaryColor,
                            AppColors.kSecondaryColor.withOpacity(0.9),
                            AppColors.kSecondaryColor.withOpacity(0.8),
                            AppColors.kSecondaryColor.withOpacity(0.2),
                            AppColors.kSecondaryColor.withOpacity(0.0),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  // PageView (للإعلانات أو عرض معلومات الأفلام)
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "The After".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "جديد • أكشن • 2023 • فيلم",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // زر الإضافة
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 16),
                                // زر بدء المشاهدة
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: const Size(130, 40),
                                  ),
                                  icon: const Icon(Icons.play_arrow,
                                      color: Colors.black),
                                  label: const Text(
                                    "بدء المشاهدة",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // زر المزيد
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.keyboard_arrow_down,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildSectionHeader("الرائج الآن", onSeeAll: () {}),
          _buildHorizontalList(),
          _buildSectionHeader("متابعة المشاهدة", onSeeAll: () {}),
          _buildHorizontalList(withResumeButton: true),
          _buildSectionHeader("آخر الأفلام", onSeeAll: () {}),
          _buildHorizontalList(),
          _buildSectionHeader("آخر الأفلام", onSeeAll: () {}),
          _buildHorizontalList(),
        ],
      ),
    );
  }

  // Header لكل قسم
  Widget _buildSectionHeader(String title, {required VoidCallback onSeeAll}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: onSeeAll,
              child: const Text(
                "عرض الكل",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // قائمة أفقية (مثل الأفلام أو متابعة المشاهدة)
  Widget _buildHorizontalList({
    bool withResumeButton = false,
  }) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 120,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://cdn.cinematerial.com/p/297x/wuz0z6p8/suspicion-international-movie-poster-md.jpg?v=1732809501',
                      fit: BoxFit.cover,
                      width: 120,
                      height: 180,
                    ),
                  ),
                  if (withResumeButton)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text("متابعة"),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

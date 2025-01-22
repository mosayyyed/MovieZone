import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../controller/trending/trending_cubit.dart';

class TrendingMoviesBanner extends StatefulWidget {
  const TrendingMoviesBanner({super.key, required this.trendingMovieModel});
  final List<MovieModel> trendingMovieModel;

  @override
  _TrendingMoviesBannerState createState() => _TrendingMoviesBannerState();
}

class _TrendingMoviesBannerState extends State<TrendingMoviesBanner> {
  int currentIndex = 0;
  late final PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentIndex < widget.trendingMovieModel.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
      builder: (context, state) {
        bool isLoading =
            widget.trendingMovieModel.isEmpty || state is TrendingLoading;

        return SizedBox(
          height: 400,
          child: Skeletonizer(
            enabled: isLoading,
            child: Stack(
              children: [
                Positioned.fill(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.trendingMovieModel.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "$kFullImageUrl${widget.trendingMovieModel[index].backdropPath}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.kSecondaryColor,
                          AppColors.kSecondaryColor.withAlpha(230),
                          AppColors.kSecondaryColor.withAlpha(100),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                // Content
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "الرائجة اليوم".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.trendingMovieModel[currentIndex].title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.trendingMovieModel[currentIndex].id.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_outline_rounded,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.play_arrow,
                                color: Colors.black),
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
                      ),
                      const SizedBox(height: 16),
                      SmoothPageIndicator(
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                          );
                        },
                        controller: _pageController,
                        count: widget.trendingMovieModel.length,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.white.withOpacity(0.5),
                          activeDotColor: AppColors.kPrimaryColor,
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

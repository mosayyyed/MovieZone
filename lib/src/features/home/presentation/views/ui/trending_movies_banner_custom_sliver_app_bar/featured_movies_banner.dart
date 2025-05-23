import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:movie_app/generated/l10n.dart';

import 'package:movie_app/src/core/ui/gradient_overlay.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/trending_movies_banner_custom_sliver_app_bar/movie_banner_background.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/trending_movies_banner_custom_sliver_app_bar/movie_banner_content.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../controller/trending/trending_cubit.dart';

class FeaturedMoviesBanner extends StatefulWidget {
  const FeaturedMoviesBanner({super.key, required this.trendingMovies});

  final List<MovieModel> trendingMovies;

  @override
  _FeaturedMoviesBannerState createState() => _FeaturedMoviesBannerState();
}

class _FeaturedMoviesBannerState extends State<FeaturedMoviesBanner> {
  int currentIndex = 0;
  late LoopPageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = LoopPageController(initialPage: 0);
    _startAutoScroll();
  }

  @override
  void didUpdateWidget(covariant FeaturedMoviesBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trendingMovies != oldWidget.trendingMovies) {
      _resetBanner();
    }
  }

  void _resetBanner() {
    _timer?.cancel();
    setState(() {
      currentIndex = 0;
      _pageController.dispose();
      _pageController = LoopPageController(initialPage: 0);
    });
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    if (widget.trendingMovies.isEmpty) return;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted) return;

      final nextIndex =
          (_pageController.page.round() + 1) % widget.trendingMovies.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  void _handleSwipe(BuildContext context, DragEndDetails details) {
    _timer?.cancel();

    final double currentPage = _pageController.page;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    int nextIndex;

    if (details.primaryVelocity! < 0) {
      nextIndex = isRtl
          ? (currentPage.round() - 1 + widget.trendingMovies.length) %
              widget.trendingMovies.length
          : (currentPage.round() + 1) % widget.trendingMovies.length;
    } else {
      nextIndex = isRtl
          ? (currentPage.round() + 1) % widget.trendingMovies.length
          : (currentPage.round() - 1 + widget.trendingMovies.length) %
              widget.trendingMovies.length;
    }

    _pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
      builder: (context, state) {
        if (state is TrendingError) {
          return Center(child: Text(state.message));
        } else if (state is TrendingLoading) {
          return Skeletonizer(
            enabled: true,
            child: MovieCarouselBanner(
              movies: state.fakeTrendingMovies,
              currentIndex: currentIndex,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              onSwipe: (details) => _handleSwipe(context, details),
            ),
          );
        } else if (state is TrendingSuccess) {
          if (state.trendingMovies.isEmpty) {
            return Center(child: Text(S.current.noDataAvailable));
          }
          return MovieCarouselBanner(
            movies: widget.trendingMovies,
            currentIndex: currentIndex,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            onSwipe: (details) => _handleSwipe(context, details),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class MovieCarouselBanner extends StatelessWidget {
  final List<MovieModel> movies;
  final int currentIndex;
  final LoopPageController controller;
  final ValueChanged<int> onPageChanged;
  final void Function(DragEndDetails) onSwipe;

  const MovieCarouselBanner({
    super.key,
    required this.movies,
    required this.currentIndex,
    required this.controller,
    required this.onPageChanged,
    required this.onSwipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRoutes.kMovieDetailsRoute.replaceFirst(
            ":id",
            movies[currentIndex].id.toString(),
          ),
        );
      },
      onHorizontalDragEnd: onSwipe,
      child: SizedBox(
        height: 400.h,
        child: Stack(
          children: [
            MovieBannerBackground(
              movies: movies,
              controller: controller,
              onPageChanged: onPageChanged,
            ),
            const GradientOverlay(),
            MovieBannerContent(
              movie: movies[currentIndex],
              pageController: controller,
              totalMovies: movies.length,
            ),
          ],
        ),
      ),
    );
  }
}

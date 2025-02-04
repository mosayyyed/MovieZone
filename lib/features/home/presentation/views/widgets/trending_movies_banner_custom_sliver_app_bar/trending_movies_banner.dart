import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

import '../../../controller/trending/trending_cubit.dart';
import '../../screen/movie_details_screen.dart';
import 'gradient_overlay.dart';
import 'movie_details_banner_section.dart';
import 'skeletonizer_loading_stack.dart';
import 'trending_movies_page_view_builder.dart';

class TrendingMoviesBanner extends StatefulWidget {
  const TrendingMoviesBanner({
    super.key,
    required this.trendingMovies,
  });

  final List<MovieModel> trendingMovies;

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
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentIndex < widget.trendingMovies.length - 1) {
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
        final isLoading =
            widget.trendingMovies.isEmpty || state is TrendingLoading;

        if (state is TrendingError) {
          return const Center(child: Text("لا توجد بيانات لعرضها"));
        }
        if (state is TrendingLoading) {
          return SkeletonizerLoadingStack();
        }
        return GestureDetector(
          onTap: () {
            final movie = widget.trendingMovies[currentIndex];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(
                  movie: movie,
                ),
              ),
            );
          },
          onHorizontalDragEnd: (details) {
            horizontalDrag(details);
          },
          child: SizedBox(
            height: 400,
            child: Stack(
              children: [
                TrendingMoviesPageViewBuilder(
                    movies: widget.trendingMovies,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
                const GradientOverlay(),
                MovieDetailsBannerSection(
                  movie: widget.trendingMovies[currentIndex],
                  pageController: _pageController,
                  totalMovies: widget.trendingMovies.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void horizontalDrag(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (velocity < 0 && currentIndex < widget.trendingMovies.length - 1) {
      // Swipe to the right (previous)
      setState(() {
        if (currentIndex > 0) {
          currentIndex--;
        }
      });
    } else if (velocity > 0 &&
        currentIndex < widget.trendingMovies.length - 1) {
      // Swipe to the left (next)
      setState(() {
        if (currentIndex < widget.trendingMovies.length - 1) {
          currentIndex++;
        }
      });
    }
    _pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

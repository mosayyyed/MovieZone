import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../controller/trending/trending_cubit.dart';
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
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentIndex < widget.trendingMovies.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
        _pageController.jumpToPage(
          currentIndex,
        );
        return;
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
        if (state is TrendingError) {
          return Center(child: Text(state.message));
        } else if (state is TrendingLoading) {
          currentIndex = 0;
          return SkeletonizerLoadingStack();
        } else if (state is TrendingSuccess) {
          if (widget.trendingMovies.isEmpty) {
            return const Center(child: Text("لا توجد بيانات لعرضها الآن"));
          }
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kMovieDetailsRoute
                  .replaceFirst(":id",
                      widget.trendingMovies[currentIndex].id.toString()));
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
        }
        return const SizedBox();
      },
    );
  }

  void horizontalDrag(DragEndDetails details) {
    _timer.cancel();
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
    _startAutoScroll();
  }
}

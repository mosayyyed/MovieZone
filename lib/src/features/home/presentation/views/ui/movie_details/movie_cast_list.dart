import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:movie_app/generated/l10n.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../core/utils/escape_parent_padding.dart';
import '../../../../data/models/movie_cast_model.dart';
import '../../../controller/cast/cast_cubit.dart';

class MovieCastList extends StatelessWidget {
  const MovieCastList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastCubit, MovieCastState>(
      builder: (context, state) {
        if (state is MovieCastSuccess) {
          return _buildCastList(state.movieCastList);
        } else if (state is MovieCastError) {
          return const SizedBox(
            height: 150,
            child: Center(
              child: Text(
                "حدث خطأ في تحميل البيانات",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),
          );
        } else if (state is MovieCastLoading) {
          return Text(S.current.noCastAvailable);
        }
        return Text(S.current.noCastAvailable);
      },
    );
  }

  Widget _buildCastList(List<MovieCastModel>? cast) {
    if (cast == null || cast.isEmpty) {
      return const SizedBox(
        height: 150,
        child: Center(
          child: Text(
            "No cast available",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ),
      );
    }

    return EscapeParentPadding(
      height: 150,
      child: ListView.separated(
        itemCount: cast.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final actor = cast[index];
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: actor.profilePath,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Skeletonizer(
                      enabled: true,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                      )),
                  errorWidget: (_, __, ___) => Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person,
                        size: 50, color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 90,
                child: Text(
                  actor.name,
                  textAlign: TextAlign.center,
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 90,
                child: Text(
                  actor.character,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}

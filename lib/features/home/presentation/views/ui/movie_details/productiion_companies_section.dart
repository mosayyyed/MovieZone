import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../data/models/movie_details_model.dart';

class ProductionCompaniesSection extends StatelessWidget {
  final MovieDetailsModel movie;
  const ProductionCompaniesSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الشركات الإنتاجية",
          style: Styles.textStyle22.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: 4),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 1,
          ),
          itemCount: movie.productionCompanies.length,
          itemBuilder: (context, index) {
            final company = movie.productionCompanies[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surface,
                child: Container(
                  padding: const EdgeInsets.all(kBorderRadius),
                  child: CachedNetworkImage(
                    imageUrl: company.logoPath,
                    color: Theme.of(context).colorScheme.onSurface,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Skeletonizer(
                        enabled: true,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                        )),
                    errorWidget: (_, __, ___) => const SizedBox(),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

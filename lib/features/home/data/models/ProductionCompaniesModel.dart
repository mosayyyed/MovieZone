import 'package:equatable/equatable.dart';

import '../../../../core/utils/app_constants.dart';

class ProductionCompaniesModel extends Equatable {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  const ProductionCompaniesModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompaniesModel(
      id: json['id'] ?? 0,
      logoPath: json['logo_path'] != null
          ? AppConstants.api.imageUrl + json['logo_path']
          : '',
      name: json['name'] ?? 'غير متوفر',
      originCountry: json['origin_country'] ?? 'غير معروف',
    );
  }

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}

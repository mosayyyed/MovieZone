import '../../../../core/utils/constants.dart';

class ProductionCompaniesModel {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompaniesModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompaniesModel(
      id: json['id'] ?? 0,
      logoPath:
          json['logo_path'] != null ? kFullImageUrl + json['logo_path'] : '',
      name: json['name'] ?? 'غير متوفر',
      originCountry: json['origin_country'] ?? 'غير معروف',
    );
  }
}

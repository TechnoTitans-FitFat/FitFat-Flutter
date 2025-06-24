import 'package:fitfat/core/api/end_points.dart';

class OfferModel {
  final String image;
  final String name;
  final double price;
  final String calories;
  final String id;
  final double offerPrice;
  final double rating;

  OfferModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    required this.id,
    required this.offerPrice,
    required this.rating,
  });

  factory OfferModel.fromJson(Map<String, dynamic> jsonData) {
    return OfferModel(
      image: jsonData[ApiKey.image]?.toString() ?? '',
      name: jsonData[ApiKey.name]?.toString() ?? '',
      price: _toDouble(jsonData[ApiKey.price]),
      calories: jsonData[ApiKey.calories]?.toString() ?? '0',
      id: jsonData[ApiKey.id]?.toString() ?? '',
      offerPrice: _toDouble(jsonData[ApiKey.offerPrice]),
      rating: _toDouble(jsonData[ApiKey.rating]),
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}

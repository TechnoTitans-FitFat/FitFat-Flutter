import 'package:fitfat/core/api/end_points.dart';

class MeatModel {
  final String image;
  final String name;
  final double price;
  final String calories;
  final String id;
  final double rating;

  MeatModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    required this.id,
    required this.rating,
  });

  factory MeatModel.fromJson(Map<String, dynamic> jsonData) {
    return MeatModel(
      image: jsonData[ApiKey.image]?.toString() ?? '',
      name: jsonData[ApiKey.name]?.toString() ?? '',
      price: _toDouble(jsonData[ApiKey.price]),
      calories: jsonData[ApiKey.calories]?.toString() ?? '0',
      id: jsonData[ApiKey.id]?.toString() ?? '',
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

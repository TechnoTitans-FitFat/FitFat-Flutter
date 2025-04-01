import 'package:fitfat/core/api/end_points.dart';

class DiabetsModel {
  final String image;
  final String name;
  final double price;
  final double calories;
  final String id;
  final double cookingTime;
  final double rating;

  DiabetsModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    required this.id,
    required this.cookingTime,
    required this.rating,
  });

  factory DiabetsModel.fromJson(Map<String, dynamic> jsonData) {
    final priceValue = jsonData[ApiKey.price];

    return DiabetsModel(
       cookingTime: jsonData[ApiKey.cookingTime]?.toDouble() ?? 0.0,
    image: jsonData[ApiKey.image] ?? '',
    name: jsonData[ApiKey.name] ?? '',
    price: priceValue is num ? priceValue.toDouble() : 0.0,
    calories: (jsonData[ApiKey.calories] as num?)?.toDouble() ?? 0.0, // FIXED
    id: jsonData[ApiKey.id] ?? '',
    rating: (jsonData[ApiKey.rating])?.toDouble() ?? 0.0 
    );

  /*static String _validateImage(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty || !Uri.parse(imageUrl).isAbsolute) {
      return 'assets/error_photo.jpg'; // Local fallback image
    }
    return imageUrl;
  }*/
}
}
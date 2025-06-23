import 'package:fitfat/core/api/end_points.dart';

class OfferModel {
  final String image;
  final String name;
  final double price;
  final String calories;
  final String id;
  final double offerPrice;
  final double rating; 

  OfferModel( 
      {required this.image,
      required this.name,
      required this.price,
      required this.calories,
      required this.id,
      required this.offerPrice,
      required this.rating,
      });

  factory OfferModel.fromJson(Map<String, dynamic> jsonData) {
    final priceValue = jsonData[ApiKey.price];
    return OfferModel(
        image: jsonData[ApiKey.image],
        name: jsonData[ApiKey.name],
        price: priceValue is num ? priceValue.toDouble() : 0.0,
        calories: jsonData[ApiKey.calories].toString(),
        id : jsonData[ApiKey.id],
        offerPrice: jsonData[ApiKey.offerPrice],
        rating: jsonData[ApiKey.rating],
        );

  }
}

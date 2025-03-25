import 'package:fitfat/core/api/end_points.dart';

class FavouritesModel {
   final String id;
  final String image;
  final String name;
  final String  calories; 
  final double  rating; 
  final int  price; 

  FavouritesModel({
   required this.id,
    required this.image,
    required this.name,
    required this.calories,
    required this.rating,
    required this.price,
  });
  factory FavouritesModel.fromJson(Map<String,dynamic> jsonData){
    return FavouritesModel(
      id: jsonData[ApiKey.id]?.toString() ?? '',
      image: jsonData[ApiKey.image] ?? '',
      name: jsonData[ApiKey.name] ?? '',
      calories: jsonData[ApiKey.calories]?.toString() ?? '0',
      rating: jsonData[ApiKey.rating] is double
    ? jsonData[ApiKey.rating]
    : double.tryParse(jsonData[ApiKey.rating].toString()) ?? 0.0,
      price: jsonData[ApiKey.price] is int 
          ? jsonData[ApiKey.price] 
          : int.tryParse(jsonData[ApiKey.price].toString()) ?? 0,
    );
  }
}

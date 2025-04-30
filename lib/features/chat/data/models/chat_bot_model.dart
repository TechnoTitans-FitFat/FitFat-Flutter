import 'package:fitfat/core/api/end_points.dart';

class ChatBotModel {
  final String id;
  final String image;
  final String name;
  final String calories; 
  final double rating; 
  final int price; 
  final List<String>? allergy;

  ChatBotModel({
   required this.id,
    required this.image,
    required this.name,
    required this.calories,
    required this.rating,
    required this.price,
    this.allergy,
  });

  factory ChatBotModel.fromJson(Map<String,dynamic> jsonData){
    return ChatBotModel(
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
      allergy: (jsonData[ApiKey.allergy] != null && jsonData[ApiKey.allergy] is List)
          ? List<String>.from(jsonData[ApiKey.allergy].map((e) => e.toString()))
          : [],
    );
  }
}

class ChatMessageModel {
  final String? message; 
  final ChatBotModel? meal; 
  final bool isUser;

  ChatMessageModel({
    this.message,
    this.meal,
    required this.isUser,
  });
}
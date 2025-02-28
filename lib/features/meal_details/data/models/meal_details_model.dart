

import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/features/main/data/models/main_screen_model.dart';

class MealDetailsModel  extends MainScreenModel{
  MealDetailsModel({
    required super.image, required super.name, required super.price, required super.calories , required String protein,
    required String carb, required String fiber , required String fat , required List<String> ingredients , required String cookingTime
  });

  factory MealDetailsModel.fromJson(Map<String,dynamic> jsonData){
    return MealDetailsModel(
      image: jsonData[ApiKey.image],
      name: jsonData[ApiKey.name],
      price: jsonData[ApiKey.price].toString(),
      calories: jsonData[ApiKey.calories].toString(),
      protein: jsonData[ApiKey.protein],
      carb: jsonData[ApiKey.carb],
      fat: jsonData[ApiKey.fat],
      fiber: jsonData[ApiKey.fiber],
      ingredients: jsonData[ApiKey.ingredients.toString()], 
      cookingTime: jsonData[ApiKey.cookingTime],
    );
  }
}
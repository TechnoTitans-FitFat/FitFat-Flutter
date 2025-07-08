import 'package:equatable/equatable.dart';

class DietInfo extends Equatable {
  final String dietType;
  final MacronutrientGoals macronutrientGoals;
  final String dietaryGoals;
  final String activityLevel;
  final String mealPreferences;

  const DietInfo({
    required this.dietType,
    required this.macronutrientGoals,
    required this.dietaryGoals,
    required this.activityLevel,
    required this.mealPreferences,
  });

  factory DietInfo.fromJson(Map<String, dynamic> json) {
    return DietInfo(
      dietType: json['dietType'] as String,
      macronutrientGoals:
          MacronutrientGoals.fromJson(json['macronutrientGoals']),
      dietaryGoals: json['dietaryGoals'] as String,
      activityLevel: json['activityLevel'] as String,
      mealPreferences: json['mealPreferences'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dietType': dietType,
      'macronutrientGoals': macronutrientGoals.toJson(),
      'dietaryGoals': dietaryGoals,
      'activityLevel': activityLevel,
      'mealPreferences': mealPreferences,
    };
  }

  @override
  List<Object> get props => [
        dietType,
        macronutrientGoals,
        dietaryGoals,
        activityLevel,
        mealPreferences,
      ];
}

class MacronutrientGoals extends Equatable {
  final int proteins;
  final int carbs;
  final int fats;
  final int calories;

  const MacronutrientGoals({
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.calories,
  });

  factory MacronutrientGoals.fromJson(Map<String, dynamic> json) {
    return MacronutrientGoals(
      proteins: json['proteins'] as int,
      carbs: json['carbs'] as int,
      fats: json['fats'] as int,
      calories: json['calories'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'proteins': proteins,
      'carbs': carbs,
      'fats': fats,
      'calories': calories,
    };
  }

  @override
  List<Object> get props => [proteins, carbs, fats, calories];
}

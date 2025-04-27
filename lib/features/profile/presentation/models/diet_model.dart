
class GetDietInfoModel {
  final bool status;
  final DietInfo dietInfo;

  GetDietInfoModel({required this.status, required this.dietInfo});

  factory GetDietInfoModel.fromJson(Map<String, dynamic> json) {
    return GetDietInfoModel(
      status: json['status'],
      dietInfo: DietInfo.fromJson(json['dietInfo']),
    );
  }
}

class DietInfo {
  final MacronutrientGoals macronutrientGoals;
  final String id;
  final String userId;
  final String dietType;
  final String dietaryGoals;
  final String activityLevel;
  final String mealPreferences;

  DietInfo({
    required this.macronutrientGoals,
    required this.id,
    required this.userId,
    required this.dietType,
    required this.dietaryGoals,
    required this.activityLevel,
    required this.mealPreferences,
  });

  factory DietInfo.fromJson(Map<String, dynamic> json) {
    return DietInfo(
      macronutrientGoals: MacronutrientGoals.fromJson(json['macronutrientGoals']),
      id: json['_id'],
      userId: json['userId'],
      dietType: json['dietType'],
      dietaryGoals: json['dietaryGoals'],
      activityLevel: json['activityLevel'],
      mealPreferences: json['mealPreferences'],
    );
  }
}

class MacronutrientGoals {
  final int proteins;
  final int carbs;
  final int fats;
  final int calories;

  MacronutrientGoals({
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.calories,
  });

  factory MacronutrientGoals.fromJson(Map<String, dynamic> json) {
    return MacronutrientGoals(
      proteins: json['proteins'],
      carbs: json['carbs'],
      fats: json['fats'],
      calories: json['calories'],
    );
  }
}

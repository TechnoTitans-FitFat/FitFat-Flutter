class GetDietInfo {
  final String id;
  final String userId;
  final String dietType;
  final String dietaryGoals;
  final String activityLevel;
  final String mealPreferences;
  final MacronutrientGoals macronutrientGoals;

  GetDietInfo({
    required this.id,
    required this.userId,
    required this.dietType,
    required this.dietaryGoals,
    required this.activityLevel,
    required this.mealPreferences,
    required this.macronutrientGoals,
  });

  factory GetDietInfo.fromJson(Map<String, dynamic> json) {
    return GetDietInfo(
      id: json['_id'],
      userId: json['userId'],
      dietType: json['dietType'],
      dietaryGoals: json['dietaryGoals'],
      activityLevel: json['activityLevel'],
      mealPreferences: json['mealPreferences'],
      macronutrientGoals: MacronutrientGoals.fromJson(json['macronutrientGoals']),
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

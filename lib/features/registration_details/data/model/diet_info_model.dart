class DietInfoModel {
  final String dietType;
  final Map<String, int> macronutrientGoals;
  final String dietaryGoals;
  final String activityLevel;
  final List<String> mealPreferences;

  DietInfoModel({
    required this.dietType,
    required this.macronutrientGoals,
    required this.dietaryGoals,
    required this.activityLevel,
    required this.mealPreferences,
  });

  factory DietInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return DietInfoModel(
      dietType: jsonData['dietType'],
      macronutrientGoals: Map<String, int>.from(jsonData['macronutrientGoals']),
      dietaryGoals: jsonData['dietaryGoals'],
      activityLevel: jsonData['activityLevel'],
      mealPreferences: List<String>.from(jsonData['mealPreferences']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dietType': dietType,
      'macronutrientGoals': macronutrientGoals,
      'dietaryGoals': dietaryGoals,
      'activityLevel': activityLevel,
      'mealPreferences': mealPreferences,
    };
  }
}

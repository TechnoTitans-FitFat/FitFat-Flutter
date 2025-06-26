// models/user_profile_model.dart

class MacronutrientGoals {
  final double proteins;
  final double carbs;
  final double fats;
  final double calories;

  MacronutrientGoals({
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.calories,
  });

  factory MacronutrientGoals.fromJson(Map<String, dynamic> json) {
    return MacronutrientGoals(
      proteins: (json['proteins'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
      fats: (json['fats'] ?? 0).toDouble(),
      calories: (json['calories'] ?? 0).toDouble(),
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

  MacronutrientGoals copyWith({
    double? proteins,
    double? carbs,
    double? fats,
    double? calories,
  }) {
    return MacronutrientGoals(
      proteins: proteins ?? this.proteins,
      carbs: carbs ?? this.carbs,
      fats: fats ?? this.fats,
      calories: calories ?? this.calories,
    );
  }
}

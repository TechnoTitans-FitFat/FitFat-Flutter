class HealthInfoModel {
  final List<String> foodAllergies;
  final bool diabetes;
  final int weight;
  final int height;
  final String dateOfBirth;
  final String gender;
  final Map<String, int> targetBloodSugarRange;

  HealthInfoModel({
    required this.foodAllergies,
    required this.diabetes,
    required this.weight,
    required this.height,
    required this.dateOfBirth,
    required this.gender,
    required this.targetBloodSugarRange,
  });

  factory HealthInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return HealthInfoModel(
      foodAllergies: List<String>.from(jsonData['foodAllergies']),
      diabetes: jsonData['diabetes'],
      weight: jsonData['weight'],
      height: jsonData['height'],
      dateOfBirth: jsonData['dateOfBirth'],
      gender: jsonData['gender'],
      targetBloodSugarRange:
          Map<String, int>.from(jsonData['targetBloodSugarRange']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodAllergies': foodAllergies,
      'diabetes': diabetes,
      'weight': weight,
      'height': height,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'targetBloodSugarRange': targetBloodSugarRange,
    };
  }
}

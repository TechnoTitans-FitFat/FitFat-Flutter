class PersonalInfoModel {
  final double weight;
  final double height;
  final String dateOfBirth;
  final String gender;
  final List<String> foodAllergies;
  final bool diabetes;
  final Map<String, int> targetBloodSugarRange;

  PersonalInfoModel({
    required this.weight,
    required this.height,
    required this.dateOfBirth,
    required this.gender,
    required this.foodAllergies,
    required this.diabetes,
    required this.targetBloodSugarRange,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return PersonalInfoModel(
      weight: jsonData['weight'].toDouble(),
      height: jsonData['height'].toDouble(),
      dateOfBirth: jsonData['dateOfBirth'],
      gender: jsonData['gender'],
      foodAllergies: List<String>.from(jsonData['foodAllergies']),
      diabetes: jsonData['diabetes'],
      targetBloodSugarRange:
          Map<String, int>.from(jsonData['targetBloodSugarRange']),
    );
  }
}

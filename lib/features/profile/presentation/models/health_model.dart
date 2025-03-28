class GetHealthModel {
  bool status;
  HealthInfo healthInfo;

  GetHealthModel({required this.status, required this.healthInfo});

  factory GetHealthModel.fromJson(Map<String, dynamic> json) {
    return GetHealthModel(
      status: json['status'],
      healthInfo: HealthInfo.fromJson(json['healthInfo']),
    );
  }
}

class HealthInfo {
  TargetBloodSugarRange targetBloodSugarRange;
  String id;
  String userId;
  String gender;
  String dateOfBirth;
  int weight;
  int height;
  String foodAllergies;
  bool diabetes;
  String diabetesType;

  HealthInfo({
    required this.targetBloodSugarRange,
    required this.id,
    required this.userId,
    required this.gender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.foodAllergies,
    required this.diabetes,
    required this.diabetesType,
  });

  factory HealthInfo.fromJson(Map<String, dynamic> json) {
    return HealthInfo(
      targetBloodSugarRange: TargetBloodSugarRange.fromJson(json['targetBloodSugarRange']),
      id: json['_id'],
      userId: json['userId'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      weight: json['weight'],
      height: json['height'],
      foodAllergies: json['foodAllergies'],
      diabetes: json['diabetes'],
      diabetesType: json['diabetesType'],
    );
  }
}

class TargetBloodSugarRange {
  int min;
  int max;

  TargetBloodSugarRange({required this.min, required this.max});

  factory TargetBloodSugarRange.fromJson(Map<String, dynamic> json) {
    return TargetBloodSugarRange(
      min: json['min'],
      max: json['max'],
    );
  }
}

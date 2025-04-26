class TargetBloodSugarRange {
  final double? min;
  final double? max;

  TargetBloodSugarRange({required this.min, required this.max});

  factory TargetBloodSugarRange.fromJson(Map<String, dynamic> json) {
    return TargetBloodSugarRange(
      min: json['targetBloodSugarRange']['min'],
      max: json['targetBloodSugarRange']['max'],
    );
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = {};
  if (min != null) data['min'] = min;
  if (max != null) data['max'] = max;

  return data;
  }
}

class UpdateHealthInfo {
  final String? id;
  final String? userId;
  final String? gender;
  final String? dateOfBirth;
  final double? weight;
  final double? height;
  final String? foodAllergies;
  final bool? diabetes;
  final String? diabetesType;
  final double? insulinToCarbRatio;
  final TargetBloodSugarRange? targetBloodSugarRange;
  final double? correctionFactor;

  UpdateHealthInfo({
     this.id,
     this.userId,
     this.gender,
     this.dateOfBirth,
     this.weight,
     this.height,
     this.foodAllergies,
     this.diabetes,
     this.diabetesType,
    this.insulinToCarbRatio,
    this.targetBloodSugarRange,
    this.correctionFactor
  });

  factory UpdateHealthInfo.fromJson(Map<String, dynamic> json) {
    return UpdateHealthInfo(
      id: json['_id'],
      userId: json['userId'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      weight: (json['weight']as num?)?.toDouble(),
      height: (json['height']as num?)?.toDouble(),
      foodAllergies: json['foodAllergies'],
      diabetes: json['diabetes'],
      diabetesType: json['diabetesType'],
      insulinToCarbRatio: (json['insulinToCarbRatio']as num?)?.toDouble(),
        targetBloodSugarRange: json['targetBloodSugarRange'] != null
            ? TargetBloodSugarRange.fromJson(json['targetBloodSugarRange'])
            : null,
        correctionFactor: (json['correctionFactor']as num?)?.toDouble()
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (id != null) data['_id'] = id;
    if (userId != null) data['userId'] = userId;
    if (gender != null) data['gender'] = gender;
    if (dateOfBirth != null) data['dateOfBirth'] = dateOfBirth;
    if (weight != null) data['weight'] = weight;
    if (height != null) data['height'] = height;
    if (foodAllergies != null) data['foodAllergies'] = foodAllergies;
    if (diabetes != null) data['diabetes'] = diabetes;
    if (diabetesType != null) data['diabetesType'] = diabetesType;
    if (insulinToCarbRatio != null) data['insulinToCarbRatio'] = insulinToCarbRatio;
    if(correctionFactor!=null)data['correctionFactor'] = correctionFactor;
    data['targetBloodSugarRange'] = targetBloodSugarRange?.toJson();

    return data;
  }

  UpdateHealthInfo copyWith({
    String? id,
    String? userId,
    String? gender,
    String? dateOfBirth,
    double? weight,
    double? height,
    String? foodAllergies,
    bool? diabetes,
    String? diabetesType,
    double? insulinToCarbRatio,
    TargetBloodSugarRange? targetBloodSugarRange,
    double? correctionFactor
  }) {
    return UpdateHealthInfo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      foodAllergies: foodAllergies ?? this.foodAllergies,
      diabetes: diabetes ?? this.diabetes,
      diabetesType: diabetesType ?? this.diabetesType,
      insulinToCarbRatio: insulinToCarbRatio ?? this.insulinToCarbRatio,
      targetBloodSugarRange: targetBloodSugarRange ?? this.targetBloodSugarRange,
      correctionFactor: correctionFactor ?? this.correctionFactor
    );
  }
}
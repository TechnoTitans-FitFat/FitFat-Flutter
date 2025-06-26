// models/user_profile_model.dart

import 'package:fitfat/features/profile/data/model/diet_info.dart';
import 'package:fitfat/features/profile/data/model/health_info.dart';

class UserProfileModel {
  final String id;
  final String username;
  final String email;
  final String userType;
  final bool isVerified;
  final List<HealthInfo> healthInfo;
  final List<DietInfo> dietInfo;
  final List<dynamic> address;
  final List<dynamic> wishlist;
  final String? profile;

  UserProfileModel({
    required this.id,
    required this.username,
    required this.email,
    required this.userType,
    required this.isVerified,
    required this.healthInfo,
    required this.dietInfo,
    required this.address,
    required this.wishlist,
    this.profile,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['_id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      userType: json['userType'] ?? '',
      isVerified: json['isVerified'] ?? false,
      healthInfo: (json['healthInfo'] as List<dynamic>?)
              ?.map((item) => HealthInfo.fromJson(item))
              .toList() ??
          [],
      dietInfo: (json['dietInfo'] as List<dynamic>?)
              ?.map((item) => DietInfo.fromJson(item))
              .toList() ??
          [],
      address: json['address'] ?? [],
      wishlist: json['wishlist'] ?? [],
      profile: json['profile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'userType': userType,
      'isVerified': isVerified,
      'healthInfo': healthInfo.map((item) => item.toJson()).toList(),
      'dietInfo': dietInfo.map((item) => item.toJson()).toList(),
      'address': address,
      'wishlist': wishlist,
      'profile': profile,
    };
  }

  UserProfileModel copyWith({
    String? id,
    String? username,
    String? email,
    String? userType,
    bool? isVerified,
    List<HealthInfo>? healthInfo,
    List<DietInfo>? dietInfo,
    List<dynamic>? address,
    List<dynamic>? wishlist,
    String? profile,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      userType: userType ?? this.userType,
      isVerified: isVerified ?? this.isVerified,
      healthInfo: healthInfo ?? this.healthInfo,
      dietInfo: dietInfo ?? this.dietInfo,
      address: address ?? this.address,
      wishlist: wishlist ?? this.wishlist,
      profile: profile ?? this.profile,
    );
  }
}

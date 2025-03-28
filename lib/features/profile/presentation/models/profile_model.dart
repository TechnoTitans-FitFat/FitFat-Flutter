import 'package:fitfat/core/api/end_points.dart';

class UserModel {
  final String username;
  final String email;
  final String profile;

  UserModel({
    required this.profile,
    required this.username,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      profile: jsonData[ApiKey.profile],
        email: jsonData["email"] ?? "guest@example.com",
        username: jsonData[ApiKey.username] ??"Yasmeen",

    );
  }
}
import 'package:fitfat/core/api/end_points.dart';

class SignInModel {
  
  final String name;
  final String email;
  final String id;
  final String token;

  SignInModel(
      {required this.name,
        required this.email,
        required this.id,
        required this.token
        });

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      token: jsonData[ApiKey.token],
      id: jsonData['_id'],
      name: jsonData['username'],
      email: jsonData['email'],
    );
  }
}
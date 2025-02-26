class SignInModel {
  final String token;
  final String name;
  final String email;
  final String id;

  SignInModel(
      {required this.name,
        required this.email,
        required this.id,
        required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      token: jsonData['token'],
      id: jsonData['_id'],
      name: jsonData['username'],
      email: jsonData['email'],
    );
  }
}
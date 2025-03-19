class SignInModel {
  
  final String name;
  final String email;
  final String id;

  SignInModel(
      {required this.name,
        required this.email,
        required this.id,
        });

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      
      id: jsonData['_id'],
      name: jsonData['username'],
      email: jsonData['email'],
    );
  }
}
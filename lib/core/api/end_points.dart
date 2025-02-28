class EndPoint {
  static String baseUrl = "https://fitfat-backend.up.railway.app";
  static String signIn = "$baseUrl/login";
  static String signUp = "$baseUrl/register";
  static String home = 'api/recipes?';
  static String meal_details = '$baseUrl/recipes/67af615680efb92a38be688c';
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "_id";
  static String username = "username";
  static String name = "name";
  static String confirmPassword = "confirmPassword";
  static String image = 'image';
  static String price = 'price';
  static String calories = 'calories';
  static String protein = 'protein';
  static String carb = 'carb';
  static String fiber = 'fiber';
  static String fat = 'fat';
  static List<String> ingredients = ['ingredients'];
  static String cookingTime = 'cookingTime';
}

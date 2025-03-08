class EndPoint {
  static String baseUrl = "https://fitfat-backend.up.railway.app";
  static String signIn = "$baseUrl/login";
  static String signUp = "$baseUrl/register";
  static String home = 'api/recipes?';
  static String suggestions = 'api/recipes?';
  static String meal_details = '$baseUrl/api/recipes/';
  static String healthInfo =
      'https://fitfat-backend.up.railway.app/api/healthInfo';
  static String dietInfo = '$baseUrl/dietInfo';

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
  static String userId = 'userId';
  static String protein = 'protein';
  static String carb = 'carb';
  static String fiber = 'fiber';
  static String fat = 'fat';
  static String ingredients = "ingredients";
  static String cookingTime = 'cookingTime';
  static String rating = "rating";
  static String weight = "weight";
  static String height = "height";
  static String gender = "gender";
  static String dateOfBirth = "dateOfBirth";
}

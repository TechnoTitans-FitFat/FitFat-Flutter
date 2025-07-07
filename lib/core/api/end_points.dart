class EndPoint {
  static String baseUrl = "https://fitfattt.azurewebsites.net";
  static String signIn = "$baseUrl/login";
  static String signUp = "$baseUrl/register";
  static String verifyEmail = "$baseUrl/verify-email";
  static String home = '$baseUrl/api/recipes/healthy?';
  static String meal_details = '$baseUrl/api/recipes/';
  static String healthInfo =
      'https://fitfattt.azurewebsites.net/api/healthInfo';
  static String dietInfo = '$baseUrl/api/dietInfo';
  static String suggestions = 'https://fitfattt.azurewebsites.net/api/recipes/user-preferences';
  static String favourites = '$baseUrl/api/favorites';
  static String dietview =
      '$baseUrl/api/recipes/healthy?category=diet&rating=5';
  static String ketoView =
      '$baseUrl/api/recipes/healthy?category=diet&rating=5&diet=Keto';
  static String veganView =
      '$baseUrl/api/recipes/healthy?category=diet&rating=5&diet=Vegan';
  static String highCarbView =
      '$baseUrl/api/recipes/healthy?category=diet&rating=5&diet=High-Carb';
  static String lowCarbView =
      '$baseUrl/api/recipes/healthy?category=diet&rating=5&diet=Low-Carb';

  static String diabetsView =
      '$baseUrl/api/recipes/healthy?diabetes=true&rating=5';
  static String allergyView =
      '$baseUrl/api/recipes/healthy?category=allergy&rating=5';
  static String lactoseView =
      '$baseUrl/api/recipes/healthy?category=allergy&allergy=Lactose&rating=5';
  static String peanutsView =
      '$baseUrl/api/recipes/healthy?category=allergy&allergy=Peanuts&rating=5';
  static String wheatView =
      '$baseUrl/api/recipes/healthy?category=allergy&allergy=Wheat&rating=5';
  static String shellFishView =
      '$baseUrl/api/recipes/healthy?category=allergy&allergy=ShellFish&rating=5';
  static String logout = '$baseUrl/logout';
  static String profile = "$baseUrl/api/users/";
  static String getHealthInfo =
      "https://fitfattt.azurewebsites.net/api/healthInfo/";
  static String getDietInfo = "$baseUrl/api/dietInfo/";
  static String menu = '$baseUrl/api/recipes//unhealthy?';
  static const String resendOtp = '/resend-otp';
  static const String chatBot =
      'https://web-production-8f1d8.up.railway.app/recommend';
  static const String search =
      'https://fitfattt.azurewebsites.net/api/recipes/search?';
  static const String searchHistory =
      'https://fitfattt.azurewebsites.net/api/recipes/search';
  static const String offer =
      'https://fitfattt.azurewebsites.net/api/recipes/offer';
  static const String chicken = 'https://fitfattt.azurewebsites.net/api/recipes/search?page=1&limit=10&type=Meat';
  static const String sandwich = 'https://fitfattt.azurewebsites.net/api/recipes/search?page=1&limit=10&type=Sandwich';
  static const String soup = 'https://fitfattt.azurewebsites.net/api/recipes/search?page=1&limit=10&type=Soup';

}

class ApiKey {
  static String profile = "profile";
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
  static String otp = "otp";
  static String diet = "diet";
  static String allergy = "allergy";
  static String offerPrice = 'offerPrice';
}

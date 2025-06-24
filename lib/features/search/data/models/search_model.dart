class SearchRecipeModel {
  final String id;
  final String name;
  final String image;
  final int calories;
  final int price;
  final double rating; 

  SearchRecipeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.calories,
    required this.price,
    required this.rating, 
  });

  factory SearchRecipeModel.fromJson(Map<String, dynamic> json) {
    return SearchRecipeModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      calories: (json['calories'] ?? 0) is int
          ? json['calories']
          : int.tryParse(json['calories'].toString()) ?? 0,
      price: (json['price'] ?? 0) is int
          ? json['price']
          : int.tryParse(json['price'].toString()) ?? 0,
      rating: (json['rating'] ?? 0) is double
          ? json['rating']
          : double.tryParse(json['rating'].toString()) ?? 0.0, 
    );
  }
}

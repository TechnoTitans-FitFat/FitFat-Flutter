class CartModel {
  final String title;
  final double price;
  final int calories;
  final double rating;
  final String image;
  int count;

   CartModel({
    required this.title,
    required this.price,
    required this.calories,
    required this.rating,
    required this.image,
    this.count = 1,
  });

  
}
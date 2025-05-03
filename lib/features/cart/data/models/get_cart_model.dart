class CartItem {
  final String id;
  final String productId;
  final String name;
  final double price;
  final double calories;
  final int quantity;
  final double totalPrice;
  final double totalCalories;
  final String image;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.calories,
    required this.quantity,
    required this.totalPrice,
    required this.totalCalories,
    required this.image
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      image: json['image'],
      id: json['_id'],
      productId: json['productId'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      calories: (json['calories'] as num).toDouble(),
      quantity: json['quantity'] as int,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      totalCalories: (json['totalCalories'] as num).toDouble(),
    );
  }

}

class GetCartModel {
  final List<CartItem> cartItems;
  final int totalCartPrice;
  final int totalCartCalories;

  GetCartModel({
    required this.cartItems,
    required this.totalCartPrice,
    required this.totalCartCalories,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      cartItems: (json['cart'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      totalCartPrice: (json['totalCartPrice'] as num).toInt(),
      totalCartCalories: (json['totalCartCalories'] as num).toInt(),
    );
  }
}

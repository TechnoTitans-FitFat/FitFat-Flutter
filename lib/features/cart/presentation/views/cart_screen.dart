import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/features/cart/data/models/cart_model.dart';
import 'package:fitfat/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:fitfat/features/cart/presentation/widgets/cart_screen_body.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  final List<CartModel> cartItems = [
      CartModel(
        title: "Beef Bourguignon",
        price: 60,
        calories: 400,
        rating: 3.3,
        image: 'assets/images/photo.png',
        count: 1
      ),
      CartModel(
        title: "Grilled Chicken",
        price: 90,
        calories: 350,
        rating: 4.2,
        image: 'assets/images/photo.png',
      ),
       CartModel(
        title: "Beef Bourguignon",
        price: 100,
        calories: 400,
        rating: 3.3,
        image: 'assets/images/photo.png',
        count: 1
      ),
       CartModel(
        title: "Grilled Chicken",
        price: 110,
        calories: 350,
        rating: 4.2,
        image: 'assets/images/photo.png',
        count: 1
      ),
    ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.backgroundColor,
      appBar:const CustomAppBar(title: 'Cart'),
      body:  Padding(
        padding:const EdgeInsets.only(left: 12, right: 16, top: 6),
        child: CartScreenBody(
          cartItems: cartItems,
          onItemCountChanged: () {
    setState(() {}); 
  },
          ),
      ),
      bottomNavigationBar: CartBottomBar(cartItems: cartItems)
    );
  }
}

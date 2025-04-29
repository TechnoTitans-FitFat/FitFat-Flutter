// import 'package:fitfat/core/constants/light_colors.dart';
// import 'package:fitfat/core/widgets/custom_app_bar.dart';
// import 'package:fitfat/features/cart/data/models/cart_model.dart';
// import 'package:fitfat/features/cart/presentation/widgets/cart_bottom_bar.dart';
// import 'package:fitfat/features/cart/presentation/widgets/cart_screen_body.dart';
// import 'package:flutter/material.dart';
//
// class CartScreen extends StatefulWidget {
//    CartScreen({super.key});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   @override
//   final List<CartModel> cartItems = [
//       CartModel(
//         title: "Beef Bourguignon",
//         price: 60,
//         calories: 400,
//         rating: 3.3,
//         image: 'assets/images/photo.png',
//         count: 1
//       ),
//       CartModel(
//         title: "Grilled Chicken",
//         price: 90,
//         calories: 350,
//         rating: 4.2,
//         image: 'assets/images/photo.png',
//       ),
//        CartModel(
//         title: "Beef Bourguignon",
//         price: 100,
//         calories: 400,
//         rating: 3.3,
//         image: 'assets/images/photo.png',
//         count: 1
//       ),
//        CartModel(
//         title: "Grilled Chicken",
//         price: 110,
//         calories: 350,
//         rating: 4.2,
//         image: 'assets/images/photo.png',
//         count: 1
//       ),
//     ];
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppLightColor.backgroundColor,
//       appBar:const CustomAppBar(title: 'Cart'),
//       body:  Padding(
//         padding:const EdgeInsets.only(left: 12, right: 16, top: 6),
//         child: CartScreenBody(
//           cartItems: cartItems,
//           onItemCountChanged: () {
//     setState(() {});
//   },
//           ),
//       ),
//       bottomNavigationBar: CartBottomBar(cartItems: cartItems)
//     );
//   }
// }

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/features/cart/cubit/get_cart_cubit.dart';
import 'package:fitfat/features/cart/data/models/get_cart_model.dart'; // تغيير النموذج
import 'package:fitfat/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:fitfat/features/cart/presentation/widgets/cart_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // إضافة استيراد الCubit

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    // جلب بيانات السلة عند فتح الشاشة
    context.read<GetCartCubit>().getCart(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.backgroundColor,
      appBar: const CustomAppBar(title: 'Cart'),
      body: BlocBuilder<GetCartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
            return Center(child: Text('حدث خطأ: ${state.message}'));
          } else if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.only(left: 12, right: 16, top: 6),
              child: CartScreenBody(
                cartItems: state.cart.cartItems,
                onItemCountChanged: () {
                  // استدعاء getCart مرة أخرى لتحديث البيانات
                  context.read<GetCartCubit>().getCart(context: context);
                },
              ),
            );
          } else {
            return const Center(child: Text('يرجى تحديث السلة'));
          }
        },
      ),
       // bottomNavigationBar: CartBottomBar(cartItems: cartItems)
    );
  }
}
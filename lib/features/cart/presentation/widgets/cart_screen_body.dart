import 'package:fitfat/features/cart/data/models/cart_model.dart';
import 'package:fitfat/features/cart/presentation/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';

class CartScreenBody extends StatelessWidget {
  final List<CartModel> cartItems;
   final VoidCallback onItemCountChanged; 
   CartScreenBody({super.key, required this.cartItems,required this.onItemCountChanged});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     itemCount: cartItems.length,
     itemBuilder: (context, index) {
       return  Padding(
         padding:const EdgeInsets.only(bottom: 14,left: 4,top: 8),
         child: CartListItem(
          item: cartItems[index],
           onCountChanged: onItemCountChanged
          
         ),
       );
     }
     );
  }
}
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/data/models/get_cart_model.dart';
import 'package:fitfat/features/cart/presentation/widgets/custom_button_cart.dart';
import 'package:flutter/material.dart';

class CartBottomBar extends StatefulWidget {
    final List<CartItem> cartItems;

  const CartBottomBar({super.key,required this.cartItems});

  @override
  State<CartBottomBar> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {
  @override
  Widget build(BuildContext context) {
     final subtotal = widget.cartItems.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity).toInt(),
    );
    const tax = 50;
    final total = subtotal + tax;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: AppLightColor.whiteColor,
              border: Border.all(color: AppLightColor.whiteColor0, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal',
                        style: AppStyles.textStyle16.copyWith(
                            color: AppLightColor.blackColor.withOpacity(.5))),
                    Row(
                      children: [
                        Text(subtotal.toStringAsFixed(0),
                            style: AppStyles.textStyle16.copyWith(
                                color:
                                    AppLightColor.blackColor.withOpacity(.5))),
                        Text(' EGP',
                            style: AppStyles.textStyle16.copyWith(
                                color:
                                    AppLightColor.blackColor.withOpacity(.5)))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax and Fees',
                        style: AppStyles.textStyle16.copyWith(
                            color: AppLightColor.blackColor.withOpacity(.5))),
                    Row(
                      children: [
                        Text(tax.toStringAsFixed(0),
                            style: AppStyles.textStyle16.copyWith(
                                color:
                                    AppLightColor.blackColor.withOpacity(.5))),
                        Text(' EGP',
                            style: AppStyles.textStyle16.copyWith(
                                color:
                                    AppLightColor.blackColor.withOpacity(.5)))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style: AppStyles.textStyle16
                            .copyWith(color: AppLightColor.mainColor)),
                    Row(
                      children: [
                        Text(total.toStringAsFixed(0),
                            style: AppStyles.textStyle16
                                .copyWith(color: AppLightColor.mainColor)),
                        Text(' EGP',
                            style: AppStyles.textStyle16
                                .copyWith(color: AppLightColor.blackColor))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: CustomButtonCart(
                  color: AppLightColor.mainColor,
                  text: 'Checkout',
                )),
              ],
            ),
          ),
        ),
      );
  }
}
import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/data/models/get_cart_model.dart';
import 'package:fitfat/features/cart/presentation/widgets/custom_button_cart.dart';
import 'package:flutter/material.dart';

class CartBottomBar extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartBottomBar({super.key, required this.cartItems});

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
            color: context.theme.whiteColor,
            border: Border.all(color: context.theme.whiteColor, width: 2)),
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
                          color: context.theme.blackColor.withOpacity(.5))),
                  Row(
                    children: [
                      Text(subtotal.toStringAsFixed(0),
                          style: AppStyles.textStyle16.copyWith(
                              color: context.theme.blackColor.withOpacity(.5))),
                      Text(' EGP',
                          style: AppStyles.textStyle16.copyWith(
                              color: context.theme.blackColor.withOpacity(.5)))
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
                          color: context.theme.blackColor.withOpacity(.5))),
                  Row(
                    children: [
                      Text(tax.toStringAsFixed(0),
                          style: AppStyles.textStyle16.copyWith(
                              color: context.theme.blackColor.withOpacity(.5))),
                      Text(' EGP',
                          style: AppStyles.textStyle16.copyWith(
                              color: context.theme.blackColor.withOpacity(.5)))
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
                          .copyWith(color: context.theme.mainColor)),
                  Row(
                    children: [
                      Text(total.toStringAsFixed(0),
                          style: AppStyles.textStyle16
                              .copyWith(color: context.theme.mainColor)),
                      Text(' EGP',
                          style: AppStyles.textStyle16
                              .copyWith(color: context.theme.blackColor))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: CustomButtonCart(
                color: context.theme.mainColor,
                text: 'Checkout',
              )),
            ],
          ),
        ),
      ),
    );
  }
}

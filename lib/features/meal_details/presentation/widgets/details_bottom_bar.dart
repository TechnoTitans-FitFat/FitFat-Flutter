import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/presentation/views/cart_screen.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/increase_and_decrese_count.dart';
import 'package:flutter/material.dart';

class DetailsBottomBar extends StatefulWidget {
  const DetailsBottomBar({
    super.key,
    required this.price,
  });
  final double price;

  @override
  State<DetailsBottomBar> createState() => _DetailsBottomBarState();
}

class _DetailsBottomBarState extends State<DetailsBottomBar> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xffF5F5F5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IncreaseAndDecreseCount(
                count: count,
                onIncrement: () {
                  setState(() {
                    count++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    (count * widget.price).toStringAsFixed(2),
                    style: AppStyles.textStyle24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'EGB',
                    style: AppStyles.textStyle24
                        .copyWith(color: AppLightColor.mainColor),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  CartScreen()));
            },
            child: Container(
              height: 45,
              width: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppLightColor.mainColor,
              ),
              child: Center(
                child: Text(
                  'Add To Cart',
                  style: AppStyles.textStyle16
                      .copyWith(color: AppLightColor.whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

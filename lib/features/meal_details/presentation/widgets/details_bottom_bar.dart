import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/presentation/views/cart_screen.dart';
import 'package:fitfat/features/meal_details/data/models/meal_details_model.dart';
import 'package:fitfat/features/profile/data/model/health_info.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/increase_and_decrese_count.dart';
import 'package:fitfat/features/menu/data/cart_cubit/cart_cubit.dart';
import 'package:fitfat/features/warning/warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBottomBar extends StatefulWidget {
  const DetailsBottomBar({
    super.key,
    required this.price,
    required this.id,
    required this.healthInfo,
    required this.meal,
  });

  final double price;
  final String? id;
  final HealthInfo healthInfo;
  final MealDetailsModel meal;

  @override
  State<DetailsBottomBar> createState() => _DetailsBottomBarState();
}

class _DetailsBottomBarState extends State<DetailsBottomBar> {
  int count = 1;

  void _checkAllergyAndAddToCart(BuildContext context) {
  final userAllergies = widget.healthInfo.foodAllergies
      .toLowerCase()
      .split(',')
      .map((e) => e.trim())
      .toList();

  final mealAllergies =
      widget.meal.allergy.map((e) => e.toLowerCase()).toList();

  final hasMatch = mealAllergies.any((item) => userAllergies.contains(item));

 
  if (!hasMatch) {
    final firstUserAllergy = userAllergies.isNotEmpty ? userAllergies.first : '';
    _showAllergenDialog(context, firstUserAllergy); 
  } else {
    _addToCart(context);
  }
}

  void _addToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
    context.read<CartCubit>()
      ..productId = widget.id
      ..quantity = count
      ..addCartAndIncrement(context: context);
  }

  void _showAllergenDialog(BuildContext context, String allergen) {
    showDialog(
      context: context,
      builder: (context) {
        return Warning(
          allergen: allergen,
          onConfirm: () => _addToCart(context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(color: Color(0xffF5F5F5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IncreaseAndDecreseCount(
                count: count,
                onIncrement: () => setState(() => count++),
                onDecrement: () => setState(() {
                  if (count > 1) count--;
                }),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text((count * widget.price).toStringAsFixed(2),
                      style: AppStyles.textStyle24),
                  const SizedBox(width: 8),
                  Text('EGB',
                      style: AppStyles.textStyle24
                          .copyWith(color: context.theme.mainColor)),
                ],
              ),
            ],
          ),
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(
                    context,
                    "Success",
                    "Cart Success : ${state.message}",
                    SnackBarType.success,
                  ),
                );
              }
            },
            builder: (context, state) {
              return GestureDetector(
                onTap: () => _checkAllergyAndAddToCart(context),
                child: Container(
                  height: 45,
                  width: 162,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: context.theme.mainColor,
                  ),
                  child: Center(
                    child: Text('Add To Cart',
                        style: AppStyles.textStyle16
                            .copyWith(color: context.theme.whiteColor)),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

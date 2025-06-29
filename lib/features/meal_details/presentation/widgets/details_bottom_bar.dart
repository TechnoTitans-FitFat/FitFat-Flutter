import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/presentation/views/cart_screen.dart';
import 'package:fitfat/features/meal_details/data/models/meal_details_model.dart';
import 'package:fitfat/features/profile/data/model/health_info.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/increase_and_decrese_count.dart';
import 'package:fitfat/features/menu/data/cart_cubit/cart_cubit.dart';
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

    final mealAllergies = widget.meal.allergy
        .map((e) => e.toLowerCase())
        .toList();

    final hasAllergy = mealAllergies.any((item) => userAllergies.contains(item));
    final matched = userAllergies.firstWhere(
      (a) => mealAllergies.contains(a),
      orElse: () => '',
    );

    if (hasAllergy) {
      _showAllergenDialog(context, matched);
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
        return AlertDialog(
          backgroundColor: AppLightColor.backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: AppLightColor.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.warning_amber, color: Colors.yellow[700]),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Allergen Warning',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppLightColor.greyColor1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange[50],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.close, color: Colors.yellow[700]),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allergen.capitalize(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'This dish contains $allergen',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    border: Border(
                      left: BorderSide(color: Colors.yellow[700]!, width: 5),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'According to your profile, you have listed $allergen as an allergen. This dish contains ingredients that may cause an allergic reaction.',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppLightColor.backgroundColor,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Choose another', style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppLightColor.mainColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          _addToCart(context);
                        },
                        child: const Text('Add anyway', style: TextStyle(color: AppLightColor.whiteColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                  Text((count * widget.price).toStringAsFixed(2), style: AppStyles.textStyle24),
                  const SizedBox(width: 8),
                  Text('EGB', style: AppStyles.textStyle24.copyWith(color: AppLightColor.mainColor)),
                ],
              ),
            ],
          ),
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is CartFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
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
                    color: AppLightColor.mainColor,
                  ),
                  child: Center(
                    child: Text('Add To Cart', style: AppStyles.textStyle16.copyWith(color: AppLightColor.whiteColor)),
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

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presintation/views/diet_view.dart';
import 'package:flutter/material.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DietPage()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppLightColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppLightColor.blackColor.withOpacity(0.25),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppLightColor.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

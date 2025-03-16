import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class GenderSelectionButton extends StatelessWidget {
  const GenderSelectionButton({
    super.key,
    required this.genderType,
    required this.genderImage,
    required this.isSelected,
    required this.onTap,
  });

  final String genderType;
  final String genderImage;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              isSelected ? AppLightColor.mainColor : AppLightColor.whiteColor0,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppLightColor.mainColor, width: 2),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              genderType,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.black38,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              genderImage,
              width: 90,
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}

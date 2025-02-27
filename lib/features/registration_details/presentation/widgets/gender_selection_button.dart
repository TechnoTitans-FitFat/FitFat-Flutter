import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class GenderSelectionButton extends StatelessWidget {
  const GenderSelectionButton({
    super.key,
    required this.genderType,
    required this.genderImage,
  });
  final String genderType;
  final String genderImage;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: AppLightColor.mainColor,
        padding: const EdgeInsets.all(20),
        backgroundColor: AppLightColor.whiteColor0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            genderType,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image(
            image: AssetImage(
              genderImage,
            ),
            width: 90,
            height: 90,
          ),
        ],
      ),
    );
  }
}

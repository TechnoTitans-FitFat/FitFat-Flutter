import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
   const NextButton({super.key,this.onPressed});
  final VoidCallback ? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16,right: 24),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppLightColor.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Next",
                style: TextStyle(
                    color: AppLightColor.whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
   const NextButton({super.key,this.onPressed});
  final VoidCallback ? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: AppLightColor.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
      child: const Row(
        children: [
          Center(
            child: Text(
              "Next",
              
              style: TextStyle(
                  color: AppLightColor.whiteColor, fontWeight: FontWeight.bold, fontSize: 16,),
            ),
          ),
        ],
      ),
    );
  }
}

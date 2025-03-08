import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageAuth extends StatelessWidget {
  const CustomImageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
       clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
         SvgPicture.asset(
          'imges/shrimp.svg',
          width: MediaQuery.of(context).size.width,
          height: 250,
          fit: BoxFit.fill,
        ),

        Container(
          height: 20,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: AppLightColor.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        )
       
      ],
    );
  }
}

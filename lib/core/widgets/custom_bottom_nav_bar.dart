import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2, 
            offset: const Offset(0, -3), 
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            buildNavItem(Assets.icons.home, 'Home', 0),
            buildNavItem(Assets.icons.menu, 'Menu', 1),
            buildNavItem(Assets.icons.favourite, 'Favourite', 2),
            buildNavItem(Assets.icons.cart, 'Cart', 3),
            buildNavItem(Assets.icons.profile, 'Profile', 4),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: AppLightColor.mainColor,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
          backgroundColor: Colors.transparent, 
        ),
      ),
    );
  }

  /// Helper function to build BottomNavigationBarItem
  BottomNavigationBarItem buildNavItem(String assetPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetPath,
        color: selectedIndex == index
            ? AppLightColor.mainColor
            : AppLightColor.blackColor,
      ),
      label: label,
    );
  }
}
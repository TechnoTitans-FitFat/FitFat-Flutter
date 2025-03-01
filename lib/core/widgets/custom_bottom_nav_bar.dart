import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          buildNavItem('imges/home.svg', 'Home', 0),
          buildNavItem('imges/menu.svg', 'Menu', 1),
          buildNavItem('imges/favourite.svg', 'Favourite', 2),
          buildNavItem('imges/cart.svg', 'Cart', 3),
          buildNavItem('imges/profile.svg', 'Profile', 4),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: AppLightColor.mainColor,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }

  /// Helper function to build BottomNavigationBarItem
  BottomNavigationBarItem buildNavItem(String assetPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetPath,
       color: selectedIndex == index ? AppLightColor.mainColor :AppLightColor.blackColor,
       //colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn)
      ),
      label: label,
    );
  }
}

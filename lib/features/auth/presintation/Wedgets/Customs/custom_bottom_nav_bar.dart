import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return SizedBox(
      height: 70,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppLightColor.blackColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: AppLightColor.blackColor,
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                color: AppLightColor.blackColor,
              ),
              label: 'Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: AppLightColor.blackColor),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: AppLightColor.blackColor),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: AppLightColor.mainColor,
          onTap: onTapped,
        ),
      ),
    );
  }
}

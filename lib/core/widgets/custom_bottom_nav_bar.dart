import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/extensions/context_color_extension.dart';
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
  Widget _buildIcon(String iconPath, int index, BuildContext context) {
    return GestureDetector(
      onTap: () => onTapped(index),
      child: SvgPicture.asset(iconPath,
          height: 30,
          color: selectedIndex == index
              ? context.theme.mainColor
              : context.theme.blackColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
          decoration: BoxDecoration(
            color: context.theme.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIcon(Assets.icons.home, 0, context),
              _buildIcon(Assets.icons.menu, 1, context),
              const SizedBox(width: 48),
              _buildIcon(Assets.icons.favourite, 3, context),
              _buildIcon(Assets.icons.profile, 4, context),
            ],
          ),
        ),
        Positioned(
          bottom: 19,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: GestureDetector(
            onTap: () => onTapped(2),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: context.theme.mainColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/chat.svg',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

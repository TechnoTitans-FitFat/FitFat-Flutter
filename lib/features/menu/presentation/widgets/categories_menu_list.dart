import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_card_category.dart';
import 'package:fitfat/features/menu/meat/presentation/views/meat_view.dart';
import 'package:fitfat/features/menu/sandwich/presentation/views/sandwich_view.dart';
import 'package:fitfat/features/menu/soup/presentation/views/soup_view.dart';
import 'package:flutter/material.dart';

class CategoriesMenuList extends StatelessWidget {
  const CategoriesMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MeatView()));
          },
          child: CustomCardCategory(
            text: 'Meat',
            img: 'assets/icons/meat.svg',
            color: context.theme.blackColor,
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SandwichView()));
          },
          child: CustomCardCategory(
            text: 'Sandwich',
            img: 'assets/icons/sandowichh.svg',
            color: context.theme.blackColor,
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SoupView()));
          },
          child: CustomCardCategory(
            text: 'Soup',
            img: 'assets/icons/soupp.svg',
            color: context.theme.blackColor,
          ),
        ))
      ],
    );
  }
}

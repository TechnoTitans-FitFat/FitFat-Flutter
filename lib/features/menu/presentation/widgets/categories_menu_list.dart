import 'package:fitfat/core/widgets/custom_card_category.dart';
import 'package:fitfat/features/menu/chicken/presentation/views/chicken_view.dart';
import 'package:flutter/material.dart';

class CategoriesMenuList extends StatelessWidget {
  const CategoriesMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChickenView()));
              },
              child:const CustomCardCategory(
                        text: 'Chicken',
                        img: 'assets/icons/chickenn.svg',
                      ),
            )
        ),
        Expanded(
            child: CustomCardCategory(
          text: 'Sandwich',
          img: 'assets/icons/sandowichh.svg',
        )
        ),
        Expanded(
            child: CustomCardCategory(
          text: 'Soup',
          img: 'assets/icons/soupp.svg',
        )
        )
      ],
    );
  }
}

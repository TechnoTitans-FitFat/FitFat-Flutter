import 'package:fitfat/features/main/presentaion/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items =
    [  {
        'title': 'Tuna Crunch',
        'imagePath': 'imges/meal1.jpg',
        'calories': '350',
        'showType': false,
        'price' : 170,
        'favourite' : true,
      },
      {
        'title': 'Veggie Delight',
        'imagePath': 'imges/meal2.png',
        'calories': '200',
        'showType': false, 
        'price' : 170,
        'favourite' : true,
      },
      {
        'title': 'Chicken Salad',
        'imagePath': 'imges/meal3.png',
        'calories': '400',
        'showType': false,
        'price' : 170,
        'favourite' : true,
      },
      {
        'title': 'Tuna Crunch',
        'imagePath': 'imges/meal1.jpg',
        'calories': '350',
        'showType': false,
        'price' : 170,
        'favourite' : true,
      },
      {
        'title': 'Veggie Delight',
        'imagePath': 'imges/meal2.png',
        'calories': '200',
        'showType': false, 
        'price' : 170,
        'favourite' : true,
      },
      {
        'title': 'Chicken Salad',
        'imagePath': 'imges/meal3.png',
        'calories': '400',
        'showType': false,
        'price' : 170,
         
      },


    ];
    return SingleChildScrollView(child: CustomListView(items: items)) ;
  }
}

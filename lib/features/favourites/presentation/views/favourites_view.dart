import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/favourites/presentation/widgets/favourites_view_body.dart';
import 'package:fitfat/core/widgets/custom_bottom_nav_bar.dart';

import 'package:flutter/material.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppLightColor.backgroundColor,
        title: Center(
            child: Text('My Favourites',
                style: AppStyles.textStyle24
                    .copyWith(color: AppLightColor.mainColor))),
      ),
      body: const FavouritesViewBody(),
     // bottomNavigationBar: Container(
       //   color: AppLightColor.backgroundColor,
         // child: const CustomBottomNavBar()),
    );
  }
}

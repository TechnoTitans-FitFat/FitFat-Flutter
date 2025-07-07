import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_bottom_nav_bar.dart';
import 'package:fitfat/features/cart/presentation/views/cart_screen.dart';
import 'package:fitfat/features/favourites/presentation/views/favourites_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/auto_scroll_panner.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_suggestion_grid_view.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_title.dart';
import 'package:fitfat/features/menu/presentation/views/menu_screen.dart';
import 'package:fitfat/features/profile/presentation/views/profile_view.dart';
import 'package:fitfat/features/suggestions/presentation/views/suggestion_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextFiledSearch(),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AutoScrollPanner()),
              const CustomTitle(title: 'Categories'),
              const CategoriesList(),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTitle(title: 'Suggestion'),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuggestionView(),
                          ),
                        );
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('See all',
                            style: AppStyles.textStyle16.copyWith(
                              color: AppLightColor.greyColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.039,
                            )),
                      ))
                ],
              ),
              const CustomSuggestionsGridView(
                gridType: GridType.mainScreen,
              ),
            ],
          ),
        ),
      ),
      const MenuScreen(),
      const FavouritesView(),
      const CartScreen(),
      const ProfileView(),
    ];

    return Scaffold(
        backgroundColor: AppLightColor.backgroundColor,
        body: screens[selectedIndex],
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: selectedIndex,
          onTapped: onTapped,
        ));
  }
}

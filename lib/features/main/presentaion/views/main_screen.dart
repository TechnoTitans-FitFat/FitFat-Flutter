import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_bottom_nav_bar.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_dots.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_suggestion_grid_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_text_filed.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  static final List<Widget> screens = [
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFiled(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppLightColor.blackColor.withOpacity(0.25),
                      blurRadius: 3,
                      offset: const Offset(4, 0),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("imges/meal1.jpg"),
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDots(dotsColor: AppLightColor.mainColor),
                CustomDots(dotsColor: AppLightColor.greyColor),
                CustomDots(dotsColor: AppLightColor.greyColor),
              ],
            ),
            const CustomTitle(title: 'Categories'),
            const CategoriesList(),
            const CustomTitle(title: 'Suggestion'),
            const CustomSuggestionGridView(),
          ],
        ),
      ),
    ),
    const Center(child: Text('Favourite Screen')),
    const Center(child: Text('Book Screen')),
    const Center(child: Text('List Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppLightColor.backgroundColor,
        body: screens[selectedIndex],
        bottomNavigationBar: const CustomBottomNavBar());
  }
}

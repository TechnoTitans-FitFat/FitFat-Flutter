import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_bottom_nav_bar.dart';
import 'package:fitfat/features/chat/presentation/views/chat_bot_view.dart';
import 'package:fitfat/features/favourites/presentation/views/favourites_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/auto_scroll_panner.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_suggestion_grid_view.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_title.dart';
import 'package:fitfat/features/menu/presentation/views/menu_screen.dart';
import 'package:fitfat/features/profile/presentation/views/profile_screen.dart';
import 'package:fitfat/features/suggestions/presentation/views/suggestion_view.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/core/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  bool _isAuthenticated = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    try {
      final isAuthenticated = await AuthUtils.isAuthenticated();

      if (isAuthenticated) {
        // User is authenticated
        setState(() {
          _isAuthenticated = true;
          _isLoading = false;
        });
      } else {
        // No valid authentication data
        _redirectToLogin();
      }
    } catch (e) {
      // Error checking authentication
      _redirectToLogin();
    }
  }

  Future<void> _clearLoginData() async {
    await AuthUtils.clearAuthData();
  }

  void _redirectToLogin() {
    if (mounted) {
      setState(() {
        _isLoading = false;
        _isAuthenticated = false;
      });
      Get.offAll(() => const LoginSignUp(DioComsumer),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 500));
    }
  }

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_isAuthenticated) {
      return const SizedBox.shrink(); // Will be redirected to login
    }

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
                  child: AutoScrollPanner()
                  /*Container(
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
              */
                  ),
              /* const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDots(dotsColor: AppLightColor.mainColor),
                CustomDots(dotsColor: AppLightColor.greyColor),
                CustomDots(dotsColor: AppLightColor.greyColor),
              ],
            ),
            */
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
                              color: Colors.grey,
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
      const ChatBotView(),
      const FavouritesView(),
      const ProfileScreen(),
    ];

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: screens[selectedIndex],
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: selectedIndex,
          onTapped: onTapped,
        ));
  }
}

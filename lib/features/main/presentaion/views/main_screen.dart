import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_bottom_nav_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/chat/presentation/views/chat_bot_view.dart';
import 'package:fitfat/features/favourites/presentation/views/favourites_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/auto_scroll_panner.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_suggestion_grid_view.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_title.dart';
import 'package:fitfat/features/menu/presentation/views/menu_screen.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:fitfat/features/profile/presentation/views/profile_screen.dart';
import 'package:fitfat/features/suggestions/data/suggestions_cubit/suggestions_cubit.dart';
import 'package:fitfat/features/suggestions/presentation/views/suggestion_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  bool hasFetchedSuggestions = false;

  @override
  void initState() {
    super.initState();
    final token =
        BlocProvider.of<LoginCubit>(context, listen: false).user?.token;
    if (token != null) {
      BlocProvider.of<UserProfileCubit>(context).getUserProfile(token: token);
    }
  }

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _fetchSuggestionsBasedOnProfile(UserProfileLoaded profileState) {
    if (!hasFetchedSuggestions) {
      context.read<SuggestionsCubit>().fetchSuggestionsData(
            context,
            useGeneralHealthEndpoint:
                profileState.userProfile.healthInfo[0].foodAllergies == "None"
                    ? true
                    : false,
          );
      hasFetchedSuggestions = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      BlocListener<UserProfileCubit, UserProfileState>(
        listener: (context, profileState) {
          if (profileState is UserProfileLoaded) {
            _fetchSuggestionsBasedOnProfile(profileState);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextFiledSearch(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AutoScrollPanner(),
                ),
                const CustomTitle(title: 'Categories'),
                const CategoriesList(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTitle(title: 'Suggestion'),
                    GestureDetector(
                      onTap: () {
                        final profileState =
                            context.read<UserProfileCubit>().state;
                        if (profileState is UserProfileLoaded) {
                          context.read<SuggestionsCubit>().fetchSuggestionsData(
                                context,
                                useGeneralHealthEndpoint: profileState
                                            .userProfile
                                            .healthInfo[0]
                                            .foodAllergies ==
                                        "None"
                                    ? true
                                    : false,
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuggestionView(
                                isNoneAllargy: profileState.userProfile
                                            .healthInfo[0].foodAllergies ==
                                        "None"
                                    ? true
                                    : false,
                              ),
                            ),
                          );
                        }
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'See all',
                          style: AppStyles.textStyle16.copyWith(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.039,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<SuggestionsCubit, SuggestionsState>(
                  builder: (context, state) {
                    if (state is SuggestionsLoading) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is SuggestionsSuccess) {
                      return const CustomSuggestionsGridView(
                        gridType: GridType.mainScreen,
                      );
                    } else if (state is SuggestionsFailure) {
                      return Center(
                        child: Column(
                          children: [
                            Text(state.errMessage),
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      const MenuScreen(),
      const ChatBotView(),
      const FavouritesView(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: screens[selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTapped: onTapped,
      ),
    );
  }
}

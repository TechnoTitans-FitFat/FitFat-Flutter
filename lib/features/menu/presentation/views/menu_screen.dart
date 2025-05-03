import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/widgets/auto_scroll_panner.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_suggestion_grid_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_title.dart';
import 'package:fitfat/features/menu/data/cart_cubit/cart_cubit.dart';
import 'package:fitfat/features/menu/presentation/widgets/categories_menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.backgroundColor,
      body: SingleChildScrollView(
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
          const CategoriesMenuList(),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTitle(title: 'Most Popular'),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('See all',
                    style: AppStyles.textStyle16.copyWith(
                      color: AppLightColor.greyColor,
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.039,
                    )),
              )
            ],
          ),
          BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is CartFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                return const CustomSuggestionsGridView(gridType: GridType.menu);
              }),
          ],
        ),
      ),
    ),);
  }
}
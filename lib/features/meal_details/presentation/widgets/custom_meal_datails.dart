import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/insulin_calc.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMealDatails extends StatefulWidget {
  const CustomMealDatails({
    super.key,
    required this.title,
    required this.caloreis,
    required this.rating,
    required this.cookingTime,
    required this.id,
    required this.imagePath,
    required this.price,
  });
  final String id;
  final String title;
  final String caloreis;
  final double rating;
  final String cookingTime;
  final String imagePath;
  final double price;

  @override
  State<CustomMealDatails> createState() => _CustomMealDatailsState();
}

class _CustomMealDatailsState extends State<CustomMealDatails> {
  /*bool _isTapped = false;
  void _tappedImage() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        final favouritesCubit = context.watch<FavouritesCubit>();
        bool isFavourite =
            favouritesCubit.favourites.any((fav) => fav.id == widget.id);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppStyles.textStyle24,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate,
                        color: Colors.yellow,
                      ),
                      Text(
                        widget.rating.toString(),
                        style: AppStyles.textStyle16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.local_fire_department,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.caloreis,
                        style: AppStyles.textStyle16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.schedule,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.cookingTime,
                        style: AppStyles.textStyle16,
                      )
                    ],
                  )
                ],
              ),
            ),
           const InsulinCalc()
          ],
        );
      },
    );
  }
}

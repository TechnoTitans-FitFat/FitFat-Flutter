import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_card_list_view_item.dart';

class CustomListView<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) getId; // Function to get ID from item
  final String Function(T) getName;
  final String Function(T) getImage;
  final String Function(T) getType;
  final double Function(T) getCalories;
  final double Function(T) getPrice;
  final double Function(T) getRating;

  const CustomListView({
    super.key,
    required this.items,
    required this.getId,
    required this.getName,
    required this.getImage,
    required this.getType,
    required this.getCalories,
    required this.getPrice,
    required this.getRating,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        final favouritesCubit = context.watch<FavouritesCubit>();
        bool isFavourite = favouritesCubit.isFavourite(getId(item));

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: CustomCardListViewItem(
            title: getName(item),
            imagePath: getImage(item).isNotEmpty ? getImage(item) : 'assets/error_photo.jpg',
            type: getType(item),
            price: getPrice(item),
            calories: getCalories(item),
            rating: getRating(item),
            isFavourite: isFavourite,
            onFavouriteTap: () {
              if (isFavourite) {
                favouritesCubit.deleteFromFavourite(context, getId(item));
              } else {
                favouritesCubit.addToFavourite(context, getId(item));
              }
            },
          ),
        );
      },
    );
  }
}

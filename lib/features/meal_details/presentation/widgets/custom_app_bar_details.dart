import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';

class CustomAppBarDetails extends StatelessWidget implements PreferredSizeWidget {
  final String id;

  const CustomAppBarDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final favouritesCubit = context.watch<FavouritesCubit>();
    bool isFavourite = favouritesCubit.favourites.any((fav) => fav.id == id);

    return AppBar(
      backgroundColor: AppLightColor.transpernt,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            Assets.icons.back.path,
            height: 25,
            width: 25,
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              print("تم الضغط على الصورة");
              if (isFavourite) {
                favouritesCubit.deleteFromFavourite(context, id);
              } else {
                favouritesCubit.addToFavourite(context, id);
                favouritesCubit.getFavourites(context);
              }
            },
            child: Image.asset(
              isFavourite
                  ? Assets.icons.liked.path
                  : Assets.icons.component5.path,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

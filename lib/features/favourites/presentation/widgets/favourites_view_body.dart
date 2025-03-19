import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        final favouritesCubit = context.watch<FavouritesCubit>();

        if (state is FavouritesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavouritesFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is FavouritesSuccess) {
          final items = state.data.map((fav) => {
                'title': fav.name,
                'imagePath': fav.image,
                'calories': fav.calories,
                'showType': false,
                'price': fav.price,
                'rating':fav.rating,
                'favourite': true,  
              }).toList();

          return SingleChildScrollView(child: CustomListView(items: items,));
        }

        return const Center(child: Text("لا يوجد مفضلات بعد."));
      },
    );
  }
}

import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';
import 'package:fitfat/features/favourites/presentation/widgets/favourites_list_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesViewBody extends StatefulWidget {
  const FavouritesViewBody({super.key});

  @override
  State<FavouritesViewBody> createState() => _FavouritesViewBodyState();
}

class _FavouritesViewBodyState extends State<FavouritesViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavouritesCubit>().getFavourites(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouritesCubit, FavouritesState>(
      listener: (context, state) {
       if (state is FavouritesSuccess) {
        setState(() {}); 
      }
      },
      child: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          //  final favouritesCubit = context.watch<FavouritesCubit>();

          if (state is FavouritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavouritesFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is FavouritesSuccess) {
            final items = state.data
                .map((fav) => {
                      'title': fav.name,
                      'imagePath': fav.image,
                      'calories': fav.calories,
                      'showType': false,
                      'price': fav.price,
                      'rating': fav.rating,
                      'favourite': true,
                       'onFavouriteTap': () {
                        context.read<FavouritesCubit>().deleteFromFavourite(context, fav.id); 
                      },
                    })
                .toList();

            return SingleChildScrollView(
                child: FavouritesListView(items: items)
                );
          }

          return const Center(child: Text("لا يوجد مفضلات بعد."));
        },
      ),
    );
  }
}

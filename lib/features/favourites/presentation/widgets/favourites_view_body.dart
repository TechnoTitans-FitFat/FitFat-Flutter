import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';
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
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavouritesFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is FavouritesSuccess) {
          final favouritesList = state.data;

          return SingleChildScrollView(
            child: CustomListView(
              items: favouritesList,
              getId: (item) => item.id,
              getName: (item) => item.name,
              getImage: (item) => item.image,
              getType: (item) => "Favourite", // You can change this if needed
              getCalories: (item) => item.calories,
              getPrice: (item) => item.price,
              getRating: (item) => item.rating,
            ),
          );
        }
        return const Center(child: Text("لا يوجد مفضلات بعد."));
      },
    );
  }
}

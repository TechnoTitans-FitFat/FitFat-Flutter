import 'package:fitfat/features/menu/soup/data/models/soup_model.dart';
import 'package:fitfat/features/menu/soup/data/soup_cubit/soup_cubit.dart';
import 'package:fitfat/features/menu/soup/presentation/widgets/list_view_item_soup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListviewSoup extends StatelessWidget {
  const ListviewSoup({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<SoupCubit, SoupState>(
      builder: (context, state) {
        if (state is SoupLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SoupFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is SoupSuccess) {
          final List<SoupModel> meals = state.data;
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return ListViewItemSoup(meal: meals[index]);
            },
          );
        } else {
          return const SizedBox(); 
        }
      },
    );
  }
}
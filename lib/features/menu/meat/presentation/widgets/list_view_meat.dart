import 'package:fitfat/features/menu/chicken/presentation/widgets/list_view_item_chicken.dart';
import 'package:fitfat/features/menu/meat/data/meat_cubit/meat_cubit.dart';
import 'package:fitfat/features/menu/meat/data/meat_cubit/meat_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/menu/meat/data/models/meat_model.dart';

class ListViewMeat extends StatelessWidget {
  const ListViewMeat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeatCubit, MeatState>(
      builder: (context, state) {
        if (state is MeatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MeatFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is MeatSuccess) {
          final List<MeatModel> meals = state.data;
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListViewItemChicken(meal: meals[index]),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

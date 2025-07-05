import 'package:fitfat/features/menu/chicken/data/chicken_cubit/chicken_cubit.dart';
import 'package:fitfat/features/menu/chicken/data/chicken_cubit/chicken_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/menu/chicken/presentation/widgets/list_view_item_chicken.dart';
import 'package:fitfat/features/menu/chicken/data/models/chicken_model.dart';

class ListViewChicken extends StatelessWidget {
  const ListViewChicken({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChickenCubit, ChickenState>(
      builder: (context, state) {
        if (state is ChickenLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChickenFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is ChickenSuccess) {
          final List<ChickenModel> meals = state.data;
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

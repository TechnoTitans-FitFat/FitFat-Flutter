import 'package:fitfat/features/menu/sandwich/data/models/sandwich_model.dart';
import 'package:fitfat/features/menu/sandwich/data/sandwich_cubit/sandwich_cubit.dart';
import 'package:fitfat/features/menu/sandwich/presentation/widgets/list_view_item_sandwich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListviewSandwich extends StatelessWidget {
  const ListviewSandwich({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SandwichCubit, SandwichState>(
      builder: (context, state) {
        if (state is SandwichLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SandwichFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is SandwichSuccess) {
          final List<SandwichModel> meals = state.data;
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListViewItemSandwich(meal: meals[index]),
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
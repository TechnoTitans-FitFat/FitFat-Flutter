import 'package:fitfat/features/main/data/main_screen_cubit/main_screen_cubit.dart';
import 'package:fitfat/features/main/presentaion/widgets/suggestion_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSuggestionGridView extends StatelessWidget {
  const CustomSuggestionGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        if(state is MainScreenLoading){
          return const Center(child:  CircularProgressIndicator());
        } else if(state is MainScreenSucess){
          final data =state.data.take(6).toList();
        return SizedBox(
          height: 800,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 220,
              ),
              itemCount: data.length,
             itemBuilder: (context,index){
              final item=data[index];
              return SuggestionGridViewItem(
              
                id: item.id,
                imageUrl: item.image,
                title: item.name,
                calories: item.calories, price:item.price,
               
              );
             },
              ),
        );
      } else if (state is MainScreenFailure) {
          return Center(child: Text("Error: ${state.errMessage}"));
        }
         return const SizedBox();
      },
    );
  }
}

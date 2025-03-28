import 'package:fitfat/features/main/presentaion/widgets/info_text.dart';
import 'package:fitfat/features/profile/presentation/data/diet_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietUserData extends StatefulWidget {
  const DietUserData({super.key});

  @override
  State<DietUserData> createState() => _DietUserDataState();
}

class _DietUserDataState extends State<DietUserData> {

  @override
  void initState() {
    super.initState();
    context.read<GetDietInfoCubit>().getDietInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDietInfoCubit, DietInfoState>(
      builder: (context, state) {
        print("📢 Current UI state: $state");

        if (state is DietInfoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DietInfoLoaded) {
          final dietInfo = state.dietInfo.dietInfo;
          print("✅ Displaying data: ${dietInfo.dietType}");

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              infoText('Insulin-to-Carb Ratio', '1:${dietInfo.macronutrientGoals.carbs}'),
            ],
          );
        } else if (state is DietInfoError) {
          return Center(child: Text("❌ Error: ${state.message}"));
        }
        return const Center(child: Text("No data available"));
      },
    );
  }
}

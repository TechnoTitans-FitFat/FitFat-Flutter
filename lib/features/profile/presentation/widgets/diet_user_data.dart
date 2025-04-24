import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/main/presentaion/widgets/info_text.dart';
import 'package:fitfat/features/profile/presentation/data/diet_info_cubit.dart';
import 'package:fitfat/features/profile/presentation/data/health_info_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/health_model.dart';
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
    context.read<GetHealthInfoCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetHealthInfoCubit, GetHealthInfoState>(
      listener: (context, state) {
        if (state is UserError) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          final healthInfo = state.dietModel;
          print("🟢 User data loaded: ${healthInfo.healthInfo}");

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              infoText('Insulin-to-Carb Ratio', '1:${healthInfo.healthInfo.insulinToCarbRatio}'),
            ],
          );
        } else if (state is UserError) {
          return Center(child: Text("❌ Error: ${state.message}"));
        }
        return const Center(child: Text("No data available"));
      },
    );
  }
}

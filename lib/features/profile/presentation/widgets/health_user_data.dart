import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/main/presentaion/widgets/info_text.dart';
import 'package:fitfat/features/profile/presentation/data/health_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthUserData extends StatefulWidget {
  const HealthUserData({super.key});

  @override
  State<HealthUserData> createState() => _DietUserDataState();
}

class _DietUserDataState extends State<HealthUserData> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<GetHealthInfoCubit>().getUserProfile(context: context);
    });
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoText('Gender', healthInfo.healthInfo!.gender),
              const SizedBox(height: 5),
              infoText('Date Of Birth', healthInfo.healthInfo!.dateOfBirth),
              const SizedBox(height: 5),
              infoText('Height', '${healthInfo.healthInfo!.height} cm'),
              const SizedBox(height: 5),
              infoText('Weight', '${healthInfo.healthInfo!.weight} kg'),
              const SizedBox(height: 10),
              const Divider(color: AppLightColor.blackColor, endIndent: 24),
              Text(
                'Health Information',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppLightColor.blackColor,
                ),
              ),
              const SizedBox(height: 15),
              infoText(
                'Allergies',
                healthInfo.healthInfo!.foodAllergies.isNotEmpty ? healthInfo.healthInfo!.foodAllergies : 'None',
              ),
              const SizedBox(height: 5),
              if (healthInfo.healthInfo!.diabetes)
                const SizedBox(height: 5),
              if (healthInfo.healthInfo!.diabetes)
                infoText(
                  'Type of Diabetes',
                  healthInfo.healthInfo!.diabetesType.isNotEmpty ? healthInfo.healthInfo!.diabetesType : 'N/A',
                ),
              const SizedBox(height: 5),
              infoText("Insulin_TO_Carb Ratio ", '1:${healthInfo.healthInfo!.insulinToCarbRatio}'),
              const SizedBox(height: 5),
              infoText('Blood Sugar Range','${healthInfo.healthInfo!.targetBloodSugarRange!.min}-${healthInfo.healthInfo!.targetBloodSugarRange!.max}' )
            ],
          );
        } else if (state is UserError) {
          return Center(child: Text(" ${state.message}"));
        }
        return const Center(child: Text("No data available"));
      },
    );
  }
}

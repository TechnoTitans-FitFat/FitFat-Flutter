import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/profile/presentation/data/update_health_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/update_health_model.dart';
import 'package:fitfat/features/profile/presentation/widgets/allergy_selection.dart';
import 'package:fitfat/features/profile/presentation/widgets/blood_suger.dart';
import 'package:fitfat/features/profile/presentation/widgets/carb_ration_input.dart';
import 'package:fitfat/features/profile/presentation/widgets/diabetes_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondContainer extends StatefulWidget {
   const SecondContainer({super.key});

  @override
  State<SecondContainer> createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  String allergy = 'Peanuts';
  String dietType = 'Type 1';
  final TextEditingController carbToRatio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 18.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppLightColor.whiteColor),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Health Information",
                    style: TextStyle(
                        fontSize: AppStyles.textStyle18.fontSize,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Divider(color: AppLightColor.greyColor, height: 8),
                ),
                AllergySelection(
                  onAllergySelected: (selectedAllergy) {
                    setState(() {
                      allergy = selectedAllergy;
                      UpdateHealthInfoCubit();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Text(
                    "Type of Diabetes",
                    style: TextStyle(fontWeight: AppStyles.textStyle18.fontWeight,
                        fontSize: AppStyles.textStyle18.fontSize),
                  ),
                ),
                DiabetesTypeSelector(
                  onDiabetesTypeSelected: (value) {
                    dietType = value;
                    UpdateHealthInfoCubit();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Insulin-to-Carb Ratio",
                    style: TextStyle(fontWeight: AppStyles.textStyle18.fontWeight,
                        fontSize: AppStyles.textStyle18.fontSize),
                  ),
                ),
                InsulinToCarbRatioInput(onRatioChanged: (value ) {
                  final updatedHealthInfo = UpdateHealthInfo (
                       insulinToCarbRatio: carbToRatio.text.isNotEmpty ? double.tryParse(carbToRatio.text): null,
                      targetBloodSugarRange:
                      TargetBloodSugarRange(min: 78, max: 110));
                  context
                      .read<UpdateHealthInfoCubit>()
                      .updateHealthInfo(updatedHealthInfo);
                },controller: carbToRatio,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Text("Blood Suger range",style: TextStyle(fontWeight: AppStyles.textStyle18.fontWeight,
                      fontSize: AppStyles.textStyle18.fontSize)),
                ),
                BloodSuger(currentRange: const RangeValues(70, 180),)
              ],
            ),
          )),
    );
  }
}

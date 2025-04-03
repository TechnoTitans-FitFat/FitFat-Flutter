import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/profile/presentation/data/update_health_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/update_health_model.dart';
import 'package:fitfat/features/profile/presentation/widgets/gender_selection.dart';
import 'package:fitfat/features/profile/presentation/widgets/num_fields.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/date_of_birth_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({super.key});

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  String dateOfBirth = '';
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String gender = 'Female';

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateHealthInfoCubit, UpdateHealthInfoState>(
        listener: (context, state) {
          if (state is HealthInfoLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Health Info Updated Successfully!")),
            );
          } else if (state is HealthInfoError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.message}")),
            );
          }
        }, builder: (context, state) {
      return Container(
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
                  "General Information",
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
              GenderSelection(
                onGenderSelected: (selectedGender) {
                  setState(() {
                    gender = selectedGender;
                     UpdateHealthInfoCubit();
                  });
                },
              ),
              DateOfBirthSection(
                onDateChanged: (String dob) {
                  setState(() {
                    List<String> parts = dob.split('/');
                    if (parts.length == 3) {
                      String formattedDate = "${parts[2]}-${parts[1]}-${parts[0]}"; // yyyy-MM-dd

                      dateOfBirth = formattedDate;
                      print("🗓 Formatted Date: $dateOfBirth");

                      final updatedHealthInfo = UpdateHealthInfo(
                        dateOfBirth: dateOfBirth,
                        targetBloodSugarRange: TargetBloodSugarRange(min: 78, max: 110),
                      );

                      print("🚀 Sending update request with: ${updatedHealthInfo.toJson()}");

                      context.read<UpdateHealthInfoCubit>().updateHealthInfo(updatedHealthInfo);
                    } else {
                      print("⚠ Invalid date format received: $dob");
                    }
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Height",
                            style: TextStyle(
                                fontWeight: AppStyles.textStyle18.fontWeight,
                                fontSize: AppStyles.textStyle18.fontSize),
                          ),
                        ),
                        TextFieldProfile(
                          onChange: (value){
                            final updatedHealthInfo = UpdateHealthInfo (
                                height: heightController.text.isNotEmpty ? int.tryParse(heightController.text): null,
                                targetBloodSugarRange:
                                TargetBloodSugarRange(min: 78, max: 110));
                            context
                                .read<UpdateHealthInfoCubit>()
                                .updateHealthInfo(updatedHealthInfo);
                          },
                          hint: "Height",
                          lable: "Height",
                          controller: heightController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Weight",
                            style: TextStyle(
                                fontWeight: AppStyles.textStyle18.fontWeight,
                                fontSize: AppStyles.textStyle18.fontSize),
                          ),
                        ),
                        TextFieldProfile(
                          controller: weightController,
                          lable: "Weight",
                          hint: "Weight",
                          onChange: (value){
                            final updatedHealthInfo = UpdateHealthInfo (
                                weight: weightController.text.isNotEmpty ? int.tryParse(weightController.text): null,
                                targetBloodSugarRange:
                                TargetBloodSugarRange(min: 78, max: 110));
                            context
                                .read<UpdateHealthInfoCubit>()
                                .updateHealthInfo(updatedHealthInfo);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  }
    );
  }
}

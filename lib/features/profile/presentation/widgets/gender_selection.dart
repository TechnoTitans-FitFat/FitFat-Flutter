import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/profile/presentation/data/update_health_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/update_health_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.onGenderSelected});

  final Function(String) onGenderSelected;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? _selectedGender;

  List<String> items = ["Male", "Female", "Other"];

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
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Gender",
            style: TextStyle(
                fontSize: AppStyles.textStyle16.fontSize,
                fontWeight: AppStyles.textStyle18.fontWeight),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(border:Border.all(color: Colors.grey),borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: DropdownButton<String>(
                value: _selectedGender,
                hint: const Text("Select Gender"),
                dropdownColor: AppLightColor.whiteColor,
                underline: const SizedBox(),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                    widget.onGenderSelected(newValue);

                    final updatedHealthInfo = UpdateHealthInfo (
                        gender: newValue,
                        targetBloodSugarRange:
                            TargetBloodSugarRange(min: 78, max: 110));
                    context
                        .read<UpdateHealthInfoCubit>()
                        .updateHealthInfo(updatedHealthInfo);
                  }


                },
              ),
            ),
          ],
        )
      ]);
    });
  }
}

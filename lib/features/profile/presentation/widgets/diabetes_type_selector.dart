import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/profile/presentation/data/update_health_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/update_health_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiabetesTypeSelector extends StatefulWidget {
  final Function(String) onDiabetesTypeSelected;

  const DiabetesTypeSelector({super.key, required this.onDiabetesTypeSelected});

  @override
  State<DiabetesTypeSelector> createState() => _DiabetesTypeSelectorState();
}

class _DiabetesTypeSelectorState extends State<DiabetesTypeSelector> {
  String? _selectedDiabetesType;

  final List<String> _diabetesTypes = ["Type 1", "Type 2"];

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
      },
      builder: (context, state){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Row(
            children: _diabetesTypes.map((String type) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<String>(
                    value: type,
                    groupValue: _selectedDiabetesType,
                    activeColor: Colors.red,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedDiabetesType = value;

                      });
                      widget.onDiabetesTypeSelected(value!)?.call(value ?? '');
                      final updatedHealthInfo = UpdateHealthInfo(
                          diabetesType: value,
                          targetBloodSugarRange:
                          TargetBloodSugarRange(min: 78, max: 110));
                      context
                          .read<UpdateHealthInfoCubit>()
                          .updateHealthInfo(updatedHealthInfo);
                    },
                  ),
                  Text(
                    type,
                    style: TextStyle(fontSize: AppStyles.textStyle18.fontSize,fontWeight: AppStyles.textStyle18.fontWeight),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      );
      },
    );
  }
}

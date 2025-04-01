import 'package:fitfat/features/profile/presentation/data/update_health_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/update_health_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AllergySelection extends StatefulWidget {
  const AllergySelection({super.key, required this.onAllergySelected});

  final Function(String) onAllergySelected;

  @override
  State<AllergySelection> createState() => _AllergySelectionState();
}

class _AllergySelectionState extends State<AllergySelection> {
  String? _selectedAllergy;

  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateHealthInfoCubit, UpdateHealthInfoState>(
      listener: (context, state) {
        if (state is HealthInfoLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Health Info Updated Successfully!")),
          );
        } else if (state is HealthInfoError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.message}")),
          );
        }
      }, builder: (BuildContext context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownMenu(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.5,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Peanuts", label: "Peanuts"),
              DropdownMenuEntry(value: "Gluten", label: "Gluten"),
              DropdownMenuEntry(value: "Lactose", label: "Lactose"),
              DropdownMenuEntry(value: "Shellfish", label: "Shellfish"),
              DropdownMenuEntry(value: "Wheat", label: "Wheat"),
              DropdownMenuEntry(value: "None", label: "None"),
            ],
            onSelected: (String? newAllergy) {
              if (newAllergy != null) {
                setState(() {
                  _selectedAllergy = newAllergy;
                  _isValid = _selectedAllergy!.isNotEmpty;
                });
                widget.onAllergySelected(_selectedAllergy!);
                final updatedHealthInfo = UpdateHealthInfo(
                    foodAllergies: newAllergy,
                    targetBloodSugarRange:
                    TargetBloodSugarRange(min: 78, max: 110));
                context
                    .read<UpdateHealthInfoCubit>()
                    .updateHealthInfo(updatedHealthInfo);
              }
            },
          ),
          if (!_isValid)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Please select a valid allergy.',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      );
  },
    );

  }
}
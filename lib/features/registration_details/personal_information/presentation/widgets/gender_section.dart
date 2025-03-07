import 'package:fitfat/features/registration_details/personal_information/presentation/widgets/gender_selection_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/light_colors.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({
    super.key,
    required this.onSelectGender,
  });

  final void Function(String) onSelectGender;

  @override
  _GenderSectionState createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenderSelectionButton(
                genderImage: 'imges/female.png',
                genderType: 'female',
                isSelected: selectedGender == 'female',
                onTap: () {
                  setState(() {
                    selectedGender = 'female';
                  });
                  widget.onSelectGender('female');
                },
              ),
              GenderSelectionButton(
                genderImage: 'imges/male.png',
                genderType: 'male',
                isSelected: selectedGender == 'male',
                onTap: () {
                  setState(() {
                    selectedGender = 'male';
                  });
                  widget.onSelectGender('male');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

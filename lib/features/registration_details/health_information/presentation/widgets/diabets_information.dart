import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/widgets/insulin_to_card_ratio_question_section.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/widgets/type_of_diabetes_question_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiabetsInformation extends StatefulWidget {
  const DiabetsInformation({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<DiabetsInformation> createState() => _DiabetsInformationState();
}

class _DiabetsInformationState extends State<DiabetsInformation> {
  RangeValues currentRange = const RangeValues(70, 80);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const TypeOfDiabetesQuestionSection(),
          const SizedBox(
            height: 40,
          ),
          const InsulinToCardRatioQuestionSection(),
          const SizedBox(
            height: 35,
          ),
          Text(
            'What is your target blood sugar range?',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${currentRange.start.toInt()}",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 280,
                child: RangeSlider(
                  values: currentRange,
                  min: 70,
                  max: 180,
                  divisions: 11,
                  activeColor: AppLightColor.mainColor,
                  inactiveColor: Colors.grey,
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      currentRange = newRange;
                    });
                  },
                ),
              ),
              Text(
                "${currentRange.end.toInt()}",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextButton(
                  onPressed: widget.onPressed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

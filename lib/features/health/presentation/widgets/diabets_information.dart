import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiabetsInformation extends StatefulWidget {
  const DiabetsInformation({super.key});

  @override
  State<DiabetsInformation> createState() => _DiabetsInformationState();
}

class _DiabetsInformationState extends State<DiabetsInformation> {
  String? selectedType;
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
          Text(
            'What type of diabetes do you have?',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(height: 10),
          // Type 1 RadioListTile
          RadioListTile<String>(
            activeColor: AppLightColor.mainColor,
            value: 'Type 1',
            groupValue: selectedType,
            onChanged: (String? value) {
              setState(() {
                selectedType = value;
              });
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type 1',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '“Your Body Doesn\'t Produce Insulin”',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            contentPadding: EdgeInsets.zero, // Remove default padding
          ),
          // Type 2 RadioListTile
          RadioListTile<String>(
            activeColor: AppLightColor.mainColor,
            value: 'Type 2',
            groupValue: selectedType,
            onChanged: (String? value) {
              setState(() {
                selectedType = value;
              });
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type 2',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '“Your Body Doesn\'t Use Insulin Properly”',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            contentPadding: EdgeInsets.zero, // Remove default padding
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'What is your Insulin-to-Carb Ratio?',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 98,
            height: 36,
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: '1:10',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppLightColor.mainColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NextButton(),
            ],
          ),
        ],
      ),
    );
  }
}

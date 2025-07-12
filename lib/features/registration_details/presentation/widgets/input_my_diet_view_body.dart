import 'package:fitfat/core/constants/light_colors.dart';

import 'package:fitfat/features/registration_details/presentation/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputMyDietViewBody extends StatefulWidget {
  const InputMyDietViewBody({super.key});

  @override
  State<InputMyDietViewBody> createState() => _InputMyDietViewBodyState();
}

class _InputMyDietViewBodyState extends State<InputMyDietViewBody> {
  final List<String> _dietTypes = [
    'High-Carb',
    'Low Carb',
    'Keto',
    'Vegan',
  ];
  String _selectedDietType = 'Low-Carb';

  double _proteinPercentage = 30;
  double _carbsPercentage = 40;
  double _fatPercentage = 30;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Diet Type",
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _dietTypes.map((diet) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDietType = diet;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _selectedDietType == diet
                        ? AppLightColor.mainColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppLightColor.mainColor,
                    ),
                  ),
                  child: Text(
                    diet,
                    style: TextStyle(
                      color: _selectedDietType == diet
                          ? Colors.white
                          : AppLightColor.mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text(
            "Macronutrient Distribution",
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(height: 12),
          CustomSlider(
            label: "Protein",
            value: _proteinPercentage,
            min: 10,
            max: 60,
            onChanged: (value) {
              setState(() {
                _proteinPercentage = value;
                double remaining = 100 - _proteinPercentage;
                double ratio =
                    _carbsPercentage / (_carbsPercentage + _fatPercentage);
                _carbsPercentage = remaining * ratio;
                _fatPercentage = remaining * (1 - ratio);
              });
            },
          ),
          CustomSlider(
            label: "Carbs",
            value: _carbsPercentage,
            min: 10,
            max: 70,
            onChanged: (value) {
              setState(() {
                _carbsPercentage = value;
                double remaining = 100 - _carbsPercentage;
                double ratio =
                    _proteinPercentage / (_proteinPercentage + _fatPercentage);
                _proteinPercentage = remaining * ratio;
                _fatPercentage = remaining * (1 - ratio);
              });
            },
          ),
          CustomSlider(
            label: "Fat",
            value: _fatPercentage,
            min: 10,
            max: 60,
            onChanged: (value) {
              setState(() {
                _fatPercentage = value;
                double remaining = 100 - _fatPercentage;
                double ratio = _proteinPercentage /
                    (_proteinPercentage + _carbsPercentage);
                _proteinPercentage = remaining * ratio;
                _carbsPercentage = remaining * (1 - ratio);
              });
            },
          ),
          CustomSlider(
            label: "Calories",
            value: _fatPercentage,
            min: 10,
            max: 60,
            onChanged: (value) {
              setState(() {
                _fatPercentage = value;
                double remaining = 100 - _fatPercentage;
                double ratio = _proteinPercentage /
                    (_proteinPercentage + _carbsPercentage);
                _proteinPercentage = remaining * ratio;
                _carbsPercentage = remaining * (1 - ratio);
              });
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

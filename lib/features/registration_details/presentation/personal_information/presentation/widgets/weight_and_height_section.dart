import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/weight_and_height_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightAndHeightSection extends StatefulWidget {
  const WeightAndHeightSection({
    super.key,
    required this.onWeightHeightChanged,
  });

  final void Function(String weight, String height) onWeightHeightChanged;

  @override
  _WeightAndHeightSectionState createState() => _WeightAndHeightSectionState();
}

class _WeightAndHeightSectionState extends State<WeightAndHeightSection> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weight & Height",
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppLightColor.blackColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                WeightAndHeightTextField(
                  text: "Weight",
                  controller: weightController,
                  onChanged: (value) {
                    widget.onWeightHeightChanged(
                        weightController.text, heightController.text);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                WeightAndHeightTextField(
                  text: "Height",
                  controller: heightController,
                  onChanged: (value) {
                    widget.onWeightHeightChanged(
                        weightController.text, heightController.text);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}

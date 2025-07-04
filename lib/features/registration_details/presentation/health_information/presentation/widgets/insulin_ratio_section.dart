import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsulinToCardRatioSection extends StatelessWidget {
  const InsulinToCardRatioSection({
    super.key,
    required this.insulinToCardRatio,
    required this.onInsulinToCardRatioChanged,
  });

  final double insulinToCardRatio;
  final ValueChanged<double> onInsulinToCardRatioChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is your Insulin-to-Carb Ratio?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '1:',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "10",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppLightColor.greyColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                initialValue:
                    insulinToCardRatio > 0 ? insulinToCardRatio.toString() : '',
                onChanged: (value) {
                  final ratio = double.tryParse(value) ?? 0.0;
                  onInsulinToCardRatioChanged(ratio);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

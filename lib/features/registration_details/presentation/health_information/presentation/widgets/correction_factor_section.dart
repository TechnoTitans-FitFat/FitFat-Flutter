import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CorrectionFactorSection extends StatelessWidget {
  const CorrectionFactorSection({
    super.key,
    required this.correctionFactor,
    required this.onCorrectionFactorChanged,
  });

  final double correctionFactor;
  final ValueChanged<double> onCorrectionFactorChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is your Correction Factor?',
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
              '1 Unit Lowers Blood Sugar By:',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 50,
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "50",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppLightColor.greyColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                initialValue:
                    correctionFactor > 0 ? correctionFactor.toString() : '',
                onChanged: (value) {
                  final factor = double.tryParse(value) ?? 0.0;
                  onCorrectionFactorChanged(factor);
                },
              ),
            ),
            const SizedBox(width: 5),
            Text(
              'mg/dL',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

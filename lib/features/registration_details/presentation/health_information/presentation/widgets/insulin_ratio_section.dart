import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsulinRatioSection extends StatelessWidget {
  const InsulinRatioSection({
    super.key,
    required this.insulinRatio,
    required this.onInsulinRatioChanged,
  });

  final double insulinRatio;
  final ValueChanged<double> onInsulinRatioChanged;

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
            color: context.theme.blackColor,
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
                border: Border.all(color: context.theme.greyColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration:  InputDecoration(
                  hintText: "10",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: context.theme.greyColor,
                  ),
                  border: InputBorder.none,
                  contentPadding:const EdgeInsets.symmetric(vertical: 10),
                ),
                initialValue: insulinRatio > 0 ? insulinRatio.toString() : '',
                onChanged: (value) {
                  final ratio = double.tryParse(value) ?? 0.0;
                  onInsulinRatioChanged(ratio);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

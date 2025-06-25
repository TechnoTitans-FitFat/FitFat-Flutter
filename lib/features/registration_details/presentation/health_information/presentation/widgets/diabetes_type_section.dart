import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiabetesTypeSection extends StatelessWidget {
  const DiabetesTypeSection({
    super.key,
    required this.diabetesType,
    required this.onDiabetesTypeChanged,
  });

  final String diabetesType;
  final ValueChanged<String> onDiabetesTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What type of diabetes do you have?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Radio<String>(
              value: 'Type 1',
              groupValue: diabetesType,
              activeColor: Colors.red,
              onChanged: (value) {
                if (value != null) {
                  onDiabetesTypeChanged(value);
                }
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type 1',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '"Your Body Doesn\'t Produce Insulin"',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Type 2',
              groupValue: diabetesType,
              activeColor: Colors.red,
              onChanged: (value) {
                if (value != null) {
                  onDiabetesTypeChanged(value);
                }
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type 2',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '"Your Body Doesn\'t Use Insulin Properly"',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/light_colors.dart';

class YearBoxDateOfBirth extends StatefulWidget {
  final Function(int) onYearSelected;

  const YearBoxDateOfBirth({
    super.key,
    required this.onYearSelected,
  });

  @override
  _YearBoxDateOfBirthState createState() => _YearBoxDateOfBirthState();
}

class _YearBoxDateOfBirthState extends State<YearBoxDateOfBirth> {
  int _selectedYear = 2025; // Default value
  bool _isValid = true; // Validation flag

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownMenu(
          width: MediaQuery.of(context).size.width * 0.26,
          label: Text(
            "Year",
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppLightColor.greyColor1,
            ),
          ),
          hintText: "$_selectedYear",
          dropdownMenuEntries: List.generate(76, (index) {
            int year = 1950 + index;
            return DropdownMenuEntry(value: year, label: "$year");
          }),
          onSelected: (int? newYear) {
            if (newYear != null) {
              setState(() {
                _selectedYear = newYear;
                _isValid = _selectedYear >= 1950 && _selectedYear <= 2025;
              });
              widget.onYearSelected(_selectedYear); // Pass the selected year
            }
            print(_selectedYear);
          },
        ),
        if (!_isValid)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select a valid year between 1950 and 2025.',
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/light_colors.dart';

class MonthBoxPickDateOfBirth extends StatefulWidget {
  final Function(int) onMonthSelected;

  const MonthBoxPickDateOfBirth({
    super.key,
    required this.onMonthSelected,
  });

  @override
  _MonthBoxPickDateOfBirthState createState() =>
      _MonthBoxPickDateOfBirthState();
}

class _MonthBoxPickDateOfBirthState extends State<MonthBoxPickDateOfBirth> {
  int _selectedMonth = 1; // Default value
  bool _isValid = true; // Validation flag

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownMenu(
          menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppLightColor.backgroundColor,
            ),
          ),
          menuHeight: 200,
          width: MediaQuery.of(context).size.width * 0.3,
          label: Text(
            "Month",
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppLightColor.greyColor1,
            ),
          ),
          hintText: getMonthName(_selectedMonth),
          dropdownMenuEntries: List.generate(12, (index) {
            int month = index + 1;
            return DropdownMenuEntry(value: month, label: getMonthName(month));
          }),
          onSelected: (int? newMonth) {
            if (newMonth != null) {
              setState(() {
                _selectedMonth = newMonth;
                _isValid = _selectedMonth >= 1 && _selectedMonth <= 12;
              });
              widget.onMonthSelected(_selectedMonth); // Pass the selected month
            }
            print(_selectedMonth);
          },
        ),
        if (!_isValid)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select a valid month between January and December.',
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

  String getMonthName(int month) {
    const List<String> monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return monthNames[month - 1];
  }
}

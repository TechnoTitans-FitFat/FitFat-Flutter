import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/light_colors.dart';

class DayBoxPickDateOfBirth extends StatefulWidget {
  final Function(int) onDaySelected;

  const DayBoxPickDateOfBirth({
    super.key,
    required this.onDaySelected,
  });
  @override
  _DayBoxPickDateOfBirthState createState() => _DayBoxPickDateOfBirthState();
}

class _DayBoxPickDateOfBirthState extends State<DayBoxPickDateOfBirth> {
  int _selectedDay = 1; // Default value

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownMenu(
          menuHeight: 200,
          width: MediaQuery.of(context).size.width * 0.24,
          label: Text(
            "Day",
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppLightColor.greyColor1,
            ),
          ),
          hintText: "$_selectedDay",
          dropdownMenuEntries: List.generate(31, (index) {
            int day = index + 1;
            return DropdownMenuEntry(value: day, label: "$day");
          }),
          onSelected: (int? newDay) {
            if (newDay != null) {
              setState(() {
                _selectedDay = newDay;
              });
              widget.onDaySelected(_selectedDay); // Pass the selected day
            }
            print(_selectedDay);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/light_colors.dart';

class MonthBoxPickDateOfBirth extends StatelessWidget {
  const MonthBoxPickDateOfBirth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: MediaQuery.of(context).size.width * 0.3,
      label: Text(
        "Month",
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppLightColor.greyColor1,
        ),
      ),
      hintText: "January",
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: 1, label: "January"),
        DropdownMenuEntry(value: 2, label: "February"),
        DropdownMenuEntry(value: 3, label: "March"),
        DropdownMenuEntry(value: 4, label: "April"),
        DropdownMenuEntry(value: 5, label: "May"),
        DropdownMenuEntry(value: 6, label: "June"),
        DropdownMenuEntry(value: 7, label: "July"),
        DropdownMenuEntry(value: 8, label: "August"),
        DropdownMenuEntry(value: 9, label: "September"),
        DropdownMenuEntry(value: 10, label: "October"),
        DropdownMenuEntry(value: 11, label: "November"),
        DropdownMenuEntry(value: 12, label: "December"),
      ],
    );
  }
}

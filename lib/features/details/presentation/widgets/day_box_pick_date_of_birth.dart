import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/light_colors.dart';

class DayBoxPickDateOfBirth extends StatelessWidget {
  const DayBoxPickDateOfBirth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: MediaQuery.of(context).size.width * 0.24,
      label: Text(
        "Day",
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppLightColor.greyColor1,
        ),
      ),
      hintText: "1",
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: 1, label: "1"),
        DropdownMenuEntry(value: 2, label: "2"),
        DropdownMenuEntry(value: 3, label: "3"),
        DropdownMenuEntry(value: 4, label: "4"),
        DropdownMenuEntry(value: 5, label: "5"),
        DropdownMenuEntry(value: 6, label: "6"),
        DropdownMenuEntry(value: 7, label: "7"),
        DropdownMenuEntry(value: 8, label: "8"),
        DropdownMenuEntry(value: 9, label: "9"),
        DropdownMenuEntry(value: 10, label: "10"),
        DropdownMenuEntry(value: 11, label: "11"),
        DropdownMenuEntry(value: 12, label: "12"),
        DropdownMenuEntry(value: 13, label: "13"),
        DropdownMenuEntry(value: 14, label: "14"),
        DropdownMenuEntry(value: 15, label: "15"),
        DropdownMenuEntry(value: 16, label: "16"),
        DropdownMenuEntry(value: 17, label: "17"),
        DropdownMenuEntry(value: 18, label: "18"),
        DropdownMenuEntry(value: 19, label: "19"),
        DropdownMenuEntry(value: 20, label: "20"),
        DropdownMenuEntry(value: 21, label: "21"),
        DropdownMenuEntry(value: 22, label: "22"),
        DropdownMenuEntry(value: 23, label: "23"),
        DropdownMenuEntry(value: 24, label: "24"),
        DropdownMenuEntry(value: 25, label: "25"),
        DropdownMenuEntry(value: 26, label: "26"),
        DropdownMenuEntry(value: 27, label: "27"),
        DropdownMenuEntry(value: 28, label: "28"),
        DropdownMenuEntry(value: 29, label: "29"),
        DropdownMenuEntry(value: 30, label: "30"),
        DropdownMenuEntry(value: 31, label: "31"),
      ],
    );
  }
}

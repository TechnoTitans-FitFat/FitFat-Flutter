import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/day_box_pick_date_of_birth.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/month_box_pick_date_of_birth.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/year_box_date_of_birth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/light_colors.dart';

class DateOfBirthSection extends StatefulWidget {
  const DateOfBirthSection({
    super.key,
    required this.onDateChanged,
  });

  final ValueChanged<String> onDateChanged;

  @override
  _DateOfBirthSectionState createState() => _DateOfBirthSectionState();
}

class _DateOfBirthSectionState extends State<DateOfBirthSection> {
  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedYear = 2025;

  void onDaySelected(int day) {
    setState(() {
      selectedDay = day;
    });
    _notifyDateChanged();
  }

  void onMonthSelected(int month) {
    setState(() {
      selectedMonth = month;
    });
    _notifyDateChanged();
  }

  void onYearSelected(int year) {
    setState(() {
      selectedYear = year;
    });
    _notifyDateChanged();
  }

  void _notifyDateChanged() {
    final selectedDate = '${selectedDay.toString().padLeft(2, '0')}/'
        '${selectedMonth.toString().padLeft(2, '0')}/'
        '$selectedYear';
    widget.onDateChanged(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date of birth",
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
            DayBoxPickDateOfBirth(
              onDaySelected: onDaySelected,
            ),
            const Spacer(),
            MonthBoxPickDateOfBirth(
              onMonthSelected: onMonthSelected,
            ),
            const Spacer(),
            YearBoxDateOfBirth(
              onYearSelected: onYearSelected,
            ),
          ],
        ),
      ],
    );
  }
}

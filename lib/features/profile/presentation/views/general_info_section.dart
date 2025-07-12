import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';
import 'custom_dropdown.dart';
import 'custom_text_field.dart';

class GeneralInfoSection extends StatelessWidget {
  final String selectedGender;
  final String selectedMonth;
  final String selectedDay;
  final String selectedYear;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<String> onMonthChanged;
  final ValueChanged<String> onDayChanged;
  final ValueChanged<String> onYearChanged;

  const GeneralInfoSection({
    Key? key,
    required this.selectedGender,
    required this.selectedMonth,
    required this.selectedDay,
    required this.selectedYear,
    required this.heightController,
    required this.weightController,
    required this.onGenderChanged,
    required this.onMonthChanged,
    required this.onDayChanged,
    required this.onYearChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      context,
      'General Information',
      [
        CustomDropdown(
          label: 'Gender',
          value: selectedGender,
          items: ['Male', 'Female', 'Other'],
          onChanged: onGenderChanged,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Date of Birth',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    label: 'Month',
                    value: selectedMonth,
                    items: [
                      'Month',
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December'
                    ],
                    onChanged: onMonthChanged,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDropdown(
                    label: 'Day',
                    value: selectedDay,
                    items:
                        ['Day'] + List.generate(31, (index) => '${index + 1}'),
                    onChanged: onDayChanged,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDropdown(
                    label: 'Year',
                    value: selectedYear,
                    items: ['Year'] +
                        List.generate(50, (index) => '${2024 - index}'),
                    onChanged: onYearChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Height',
                controller: heightController,
                unit: 'cm',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: 'Weight',
                controller: weightController,
                unit: 'kg',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.onGenderSelected});

  final Function(String) onGenderSelected;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? _selectedGender;
  bool? _isValidGender = true;

  List<String> items = ["Female", "Male"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Gender",
            style: TextStyle(
                fontSize: AppStyles.textStyle16.fontSize,
                fontWeight: AppStyles.textStyle18.fontWeight),
          ),
        ),
        DropdownMenu(
          width: MediaQuery.of(context).size.width * 0.38,
          hintText: _selectedGender ?? "Select Gender",
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: "Male", label: "Male"),
            DropdownMenuEntry(value: "Female", label: "Female"),
            DropdownMenuEntry(value: "Other", label: "Other"),
          ],
          onSelected: (String? newGender) {
            if (newGender != null) {
              setState(() {
                _selectedGender = newGender;
                _isValidGender = _selectedGender!.isNotEmpty;
              });
              widget
                  .onGenderSelected(_selectedGender!);
            }
            print(_selectedGender);
          },
        ),
        if (!_isValidGender!)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select a valid gender.',
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

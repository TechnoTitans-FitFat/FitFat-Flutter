import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DiabetesTypeSelector extends StatefulWidget {
  final Function(String) onDiabetesTypeSelected;

  const DiabetesTypeSelector({super.key, required this.onDiabetesTypeSelected});

  @override
  State<DiabetesTypeSelector> createState() => _DiabetesTypeSelectorState();
}

class _DiabetesTypeSelectorState extends State<DiabetesTypeSelector> {
  String? _selectedDiabetesType;

  final List<String> _diabetesTypes = ["Type 1", "Type 2"];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        Row(
          children: _diabetesTypes.map((String type) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: type,
                  groupValue: _selectedDiabetesType,
                  activeColor: Colors.red,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDiabetesType = value;
                    });
                    widget.onDiabetesTypeSelected(value!)?.call(value ?? '');
                  },
                ),
                Text(
                  type,
                  style: TextStyle(fontSize: AppStyles.textStyle18.fontSize,fontWeight: AppStyles.textStyle18.fontWeight),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

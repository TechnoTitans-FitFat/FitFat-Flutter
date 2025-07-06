import 'package:fitfat/features/profile/presentation/views/custom_dropdown.dart';
import 'package:fitfat/features/profile/presentation/views/custom_text_field.dart';
import 'package:flutter/material.dart';

class HealthInfoSection extends StatelessWidget {
  final String selectedAllergy;
  final String selectedDiabetesType;
  final TextEditingController insulinCarbController;
  final TextEditingController correctionFactorController;
  final ValueChanged<String> onAllergyChanged;
  final ValueChanged<String?>? onDiabetesTypeChanged;

  const HealthInfoSection({
    Key? key,
    required this.selectedAllergy,
    required this.selectedDiabetesType,
    required this.insulinCarbController,
    required this.correctionFactorController,
    required this.onAllergyChanged,
    required this.onDiabetesTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      'Health Information',
      [
        CustomDropdown(
          label: 'Allergies',
          value: selectedAllergy,
          items: ['None', 'Peanuts', 'Dairy', 'Gluten', 'Shellfish'],
          onChanged: onAllergyChanged,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Type of Diabetes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Radio<String>(
                  value: 'Type 1',
                  groupValue: selectedDiabetesType,
                  onChanged: onDiabetesTypeChanged,
                  activeColor: Colors.red,
                ),
                const Text('Type 1'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Type 2',
                  groupValue: selectedDiabetesType,
                  onChanged: onDiabetesTypeChanged,
                  activeColor: Colors.red,
                ),
                const Text('Type 2'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Insulin-to-Carb Ratio',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('1:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                SizedBox(
                  width: 80,
                  child: CustomTextField(
                    label: 'Insulin-to-Carb',
                    controller: insulinCarbController,
                    showLabel: false,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is your Correction Factor?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('1 Unit Lowers Blood Sugar By:',
                    style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                SizedBox(
                  width: 80,
                  child: CustomTextField(
                    label: 'Correction Factor',
                    controller: correctionFactorController,
                    showLabel: false,
                  ),
                ),
                const SizedBox(width: 8),
                const Text('mg/dL', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

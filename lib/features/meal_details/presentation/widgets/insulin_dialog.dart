import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/text_field_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fitfat/core/utils/app_styles.dart';

class InsulinDialog extends StatefulWidget {
  const InsulinDialog({
    super.key,
    required this.carbValue,
    required this.correctionFactor,
    required this.insulinToCarbRatio,
    required this.onDoseCalculated,
  });

  final String carbValue;
  final double correctionFactor;
  final double insulinToCarbRatio;
  final void Function(double) onDoseCalculated;
  @override
  State<InsulinDialog> createState() => _InsulinDialogState();
}

class _InsulinDialogState extends State<InsulinDialog> {
  final TextEditingController currentController = TextEditingController();
  final TextEditingController targetController = TextEditingController();

  double? correctionDose;
  double? carbDose;
  double? totalDose;

  double parseCarb(String carbString) {
    return double.tryParse(carbString.replaceAll(RegExp(r'[^0-9.]'), '')) ??
        0.0;
  }

  void calculateDose() {
    final current = double.tryParse(currentController.text);
    final target = double.tryParse(targetController.text);
    final carbs = parseCarb(widget.carbValue);

    if (current != null && target != null) {
      final corrDose = (current - target) / widget.correctionFactor;
      final corrected = (corrDose > 0 ? corrDose : 0).toDouble();
      final carbCover = (carbs / widget.insulinToCarbRatio).toDouble();
      final total = (corrected + carbCover).toDouble();
      widget.onDoseCalculated(total);

      setState(() {
        correctionDose = corrected;
        carbDose = carbCover;
        totalDose = total;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(31),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text('Insulin Dose Calculator',
                    style: AppStyles.textStyle20)),
            const SizedBox(height: 30),
            TextFieldDialog(
              label: 'Current Blood Glucose (mg/dL)',
              hint: 'Enter your current blood sugar',
              controller: currentController,
            ),
            const SizedBox(height: 15),
            TextFieldDialog(
              label: 'Target Blood Glucose (mg/dL)',
              hint: 'Enter your target blood sugar',
              controller: targetController,
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: calculateDose,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Calculate Dose",
                    style: AppStyles.textStyle20
                        .copyWith(color: context.theme.whiteColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (totalDose != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Correction Dose: ${correctionDose!.toStringAsFixed(1)} units',
                      style: AppStyles.textStyle16),
                  Text(
                      'Carb Coverage Dose: ${carbDose!.toStringAsFixed(1)} units',
                      style: AppStyles.textStyle16),
                  const SizedBox(height: 10),
                  Text(
                      'Total Insulin Dose: ${totalDose!.toStringAsFixed(1)} units',
                      style: AppStyles.textStyle16
                          .copyWith(color: context.theme.mainColor)),
                ],
              )
          ],
        ),
      ),
    );
  }
}

import 'package:fitfat/features/meal_details/presentation/widgets/text_field_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';

class InsulinDialog extends StatefulWidget {
  const InsulinDialog({super.key});

  @override
  State<InsulinDialog> createState() => _InsulinDialogState();
}

class _InsulinDialogState extends State<InsulinDialog> {
  final TextEditingController currentController = TextEditingController();
  final TextEditingController targetController = TextEditingController();

  double? result;

  double calculateInsulin(double current, double target, {double correctionFactor = 50}) {
    double dose = (current - target) / correctionFactor;
    return dose > 0 ? dose : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppLightColor.whiteColor1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(31),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Insulin Dose Calculator', style: AppStyles.textStyle20)),
            const SizedBox(height: 30),
           TextFieldDialog(label: 'Current Blood Glucose (mg/dL)',hint: 'Enter your current blood sugar',controller: currentController,),
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
                  onPressed: () {
                    double? current = double.tryParse(currentController.text);
                    double? target = double.tryParse(targetController.text);

                    if (current != null && target != null) {
                      setState(() {
                        result = calculateInsulin(current, target);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppLightColor.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Calculate Dose",
                    style: AppStyles.textStyle20.copyWith(color: AppLightColor.whiteColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (result != null)
              Center(
                child: Text(
                  'Recommended Dose: ${result!.toStringAsFixed(1)} units',
                  style: AppStyles.textStyle16.copyWith(color: AppLightColor.mainColor),
                ),
              )
          ],
        ),
      ),
    );
  }
}

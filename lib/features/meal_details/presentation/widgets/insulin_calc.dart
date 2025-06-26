import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/insulin_dialog.dart';
import 'package:flutter/material.dart';

class InsulinCalc extends StatefulWidget {
const InsulinCalc({
    super.key,
    required this.carbValue,
    required this.correctionFactor,
    required this.insulinToCarbRatio,
  });

  final String carbValue;
  final double correctionFactor;
  final double insulinToCarbRatio;

  @override
  State<InsulinCalc> createState() => _InsulinCalcState();
}

class _InsulinCalcState extends State<InsulinCalc> {
   double? _totalDose;

  void _handleDoseCalculated(double dose) {
    setState(() {
      _totalDose = dose;
    });
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) =>  InsulinDialog(
            carbValue: widget.carbValue,
            correctionFactor: widget.correctionFactor,
            insulinToCarbRatio: widget.insulinToCarbRatio,
            onDoseCalculated: _handleDoseCalculated, 
          ),
        );
      },
      child: Container(
        height: 40,
        width: 119,
        decoration: BoxDecoration(
            color: AppLightColor.backgroundColor,
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: AppLightColor.mainColor, width: 1.4)),
        child: Center(
            child: Text(
            _totalDose != null
                ? '${_totalDose!.toStringAsFixed(1)} units'
                : 'Insulin Calc',
          style: AppStyles.textStyle16.copyWith(
            color: AppLightColor.mainColor,
          ),
        )),
      ),
    );
  }
}

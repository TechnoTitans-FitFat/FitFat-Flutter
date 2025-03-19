import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BloodSuger extends StatefulWidget {
  BloodSuger({super.key, this.onBloodSugarRangeChanged,required this.currentRange});
  final Function(RangeValues)? onBloodSugarRangeChanged;
  late RangeValues currentRange;

  @override
  State<BloodSuger> createState() => _BloodSugerState();
}

class _BloodSugerState extends State<BloodSuger> {
  @override
  RangeValues _values = RangeValues(70, 120);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${_values.start.round()}",style: TextStyle(fontSize: AppStyles.textStyle18.fontSize,color: AppLightColor.greyColor),),
        Expanded(
          child: RangeSlider(
            values: _values,
            min: 70,
            max: 120,
            divisions: 10,
            activeColor: Colors.red,
            inactiveColor: Colors.grey[300],
            onChanged: (RangeValues values) {
              setState(() {
                _values = values;
              });
            },
          ),
        ),
        Text(
          "${_values.end.round()}",style: TextStyle(fontSize: AppStyles.textStyle18.fontSize,color: AppLightColor.greyColor),
        ),
      ],
    );
  }
}

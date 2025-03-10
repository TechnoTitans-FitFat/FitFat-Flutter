import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class ActivityRadioButton extends StatefulWidget {
  final Function(String) onActivityLevelSelected;
  final String initialActivityLevel;

  const ActivityRadioButton(
      {super.key,
      required this.onActivityLevelSelected,
      this.initialActivityLevel = 'Sedentary'});

  @override
  State<ActivityRadioButton> createState() => _ActivityRadioButtonState();
}

class _ActivityRadioButtonState extends State<ActivityRadioButton> {
  late String activityLevel;

  @override
  void initState() {
    super.initState();
    activityLevel = widget.initialActivityLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text("What are your activity level?",
              style: TextStyle(
                  color: AppLightColor.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ),
        ListTile(
          title: const Text(
            "Sedentary",
            style: TextStyle(
                color: AppLightColor.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          leading: Radio<String>(
            activeColor: AppLightColor.mainColor,
            value: "Sedentary",
            groupValue: activityLevel,
            onChanged: (value) {
              setState(() {
                activityLevel = value!;
                widget.onActivityLevelSelected(activityLevel);
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            "Light Active",
            style: TextStyle(
                color: AppLightColor.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          leading: Radio<String>(
            value: "Light Active",
            activeColor: AppLightColor.mainColor,
            groupValue: activityLevel,
            onChanged: (value) {
              setState(() {
                activityLevel = value!;
                widget.onActivityLevelSelected(activityLevel);
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            "Moderately Active",
            style: TextStyle(
                color: AppLightColor.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          leading: Radio<String>(
            value: "Moderately Active",
            activeColor: AppLightColor.mainColor,
            groupValue: activityLevel,
            onChanged: (value) {
              setState(() {
                activityLevel = value!;
                widget.onActivityLevelSelected(activityLevel);
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            "Very Active",
            style: TextStyle(
                color: AppLightColor.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          leading: Radio<String>(
            value: "Very Active",
            activeColor: AppLightColor.mainColor,
            groupValue: activityLevel,
            onChanged: (value) {
              setState(() {
                activityLevel = value!;
                widget.onActivityLevelSelected(activityLevel);
              });
            },
          ),
        ),
      ],
    );
  }
}

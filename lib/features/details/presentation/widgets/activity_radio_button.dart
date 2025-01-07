import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class ActivityRadioButton extends StatefulWidget {
   const ActivityRadioButton({super.key});

  @override
  State<ActivityRadioButton> createState() => _ActivityRadioButtonState();
}

class _ActivityRadioButtonState extends State<ActivityRadioButton> {
  String activityLevel = 'Sedentary';

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
          child: Text("What are your activity level?", style: TextStyle(color: AppLightColor.blackColor,fontWeight: FontWeight.bold,fontSize: 18)),
        ),
        ListTile(
          title: const Text("Sedentary",style: TextStyle(color: AppLightColor.blackColor,fontWeight: FontWeight.bold,fontSize: 16),),
          leading: Radio<String>(
            activeColor: AppLightColor.mainColor,
            value: "Sedentary",
            groupValue: activityLevel,
            onChanged: (value) {
              setState(() {
                activityLevel = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text("Light Active",style: TextStyle(color: AppLightColor.blackColor,fontWeight: FontWeight.bold,fontSize: 16),),
          leading: Radio<String>(
            value: "Light",
            activeColor: AppLightColor.mainColor,
            groupValue: activityLevel,
            onChanged: (value) {
              setState(() {
                activityLevel = value!;
              });
            },
          ),
        ),

        ListTile(
          title: const Text("Moderately Active",style: TextStyle(color: AppLightColor.blackColor,fontWeight: FontWeight.bold,fontSize: 16),),
          leading: Radio<String>(
            value: "Moderately",
            activeColor: AppLightColor.mainColor,
            groupValue: activityLevel,
            onChanged: (value) {
              setState(() {
                activityLevel = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text("Very Active",style: TextStyle(color: AppLightColor.blackColor,fontWeight: FontWeight.bold,fontSize: 16),),
          leading: Radio<String>(
            value: "Female",
            activeColor: AppLightColor.mainColor,
            groupValue: activityLevel,
            onChanged: (value) {
              setState(() {
                activityLevel = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}

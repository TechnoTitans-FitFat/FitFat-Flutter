import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DietGoalsSelection extends StatefulWidget {
  final Function(String) onDietGoalSelected;
  final String selectedDietGoal;

  const DietGoalsSelection({
    super.key,
    required this.onDietGoalSelected,
    this.selectedDietGoal = '',
  });

  @override
  State<DietGoalsSelection> createState() => _DietGoalsSelectionState();
}

class _DietGoalsSelectionState extends State<DietGoalsSelection> {
  late String selectedDietGoal;

  @override
  void initState() {
    super.initState();
    selectedDietGoal = widget.selectedDietGoal;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What are your dietary goals?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  borderColor: AppLightColor.mainColor,
                  widget: "Weight Loss",
                  widgetColor: selectedDietGoal == "Weight Loss"
                      ? Colors.white
                      : AppLightColor.blackColor,
                  background: selectedDietGoal == "Weight Loss"
                      ? Colors.red
                      : AppLightColor.whiteColor,
                  onPressed: () {
                    setState(() {
                      selectedDietGoal = "Weight Loss";
                      widget.onDietGoalSelected(selectedDietGoal);
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: CustomButton(
                  borderColor: AppLightColor.mainColor,
                  widget: "Weight Gain",
                  widgetColor: selectedDietGoal == "Weight Gain"
                      ? Colors.white
                      : AppLightColor.blackColor,
                  background: selectedDietGoal == "Weight Gain"
                      ? Colors.red
                      : AppLightColor.whiteColor,
                  onPressed: () {
                    setState(() {
                      selectedDietGoal = "Weight Gain";
                      widget.onDietGoalSelected(selectedDietGoal);
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  borderColor: AppLightColor.mainColor,
                  widget: "Weight Maintain",
                  widgetColor: selectedDietGoal == "Weight Maintain"
                      ? Colors.white
                      : AppLightColor.blackColor,
                  background: selectedDietGoal == "Weight Maintain"
                      ? Colors.red
                      : AppLightColor.whiteColor,
                  onPressed: () {
                    setState(() {
                      selectedDietGoal = "Weight Maintain";
                      widget.onDietGoalSelected(selectedDietGoal);
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: CustomButton(
                  borderColor: AppLightColor.mainColor,
                  widget: "Muscle Gain",
                  widgetColor: selectedDietGoal == "Muscle Gain"
                      ? Colors.white
                      : AppLightColor.blackColor,
                  background: selectedDietGoal == "Muscle Gain"
                      ? Colors.red
                      : AppLightColor.whiteColor,
                  onPressed: () {
                    setState(() {
                      selectedDietGoal = "Muscle Gain";
                      widget.onDietGoalSelected(selectedDietGoal);
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

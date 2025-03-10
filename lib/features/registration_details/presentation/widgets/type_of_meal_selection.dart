import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TypeOfMealSelection extends StatefulWidget {
  final Function(String) onMealTypeSelected;
  final String selectedMealType;

  const TypeOfMealSelection({
    super.key,
    required this.onMealTypeSelected,
    this.selectedMealType = '',
  });

  @override
  State<TypeOfMealSelection> createState() => _TypeOfMealSelectionState();
}

class _TypeOfMealSelectionState extends State<TypeOfMealSelection> {
  late String selectedMealType;

  @override
  void initState() {
    super.initState();
    selectedMealType = widget.selectedMealType;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What type of meal do you prefer?",
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
                  widget: "Vegetarian",
                  widgetColor: selectedMealType == "Vegetarian"
                      ? Colors.white
                      : AppLightColor.blackColor,
                  background: selectedMealType == "Vegetarian"
                      ? Colors.red
                      : AppLightColor.whiteColor,
                  onPressed: () {
                    setState(() {
                      selectedMealType = "Vegetarian";
                      widget.onMealTypeSelected(selectedMealType);
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
                  widget: "Gluten-Free",
                  widgetColor: selectedMealType == "Gluten-Free"
                      ? Colors.white
                      : AppLightColor.blackColor,
                  background: selectedMealType == "Gluten-Free"
                      ? Colors.red
                      : AppLightColor.whiteColor,
                  onPressed: () {
                    setState(() {
                      selectedMealType = "Gluten-Free";
                      widget.onMealTypeSelected(selectedMealType);
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
                  widget: "Vegan",
                  widgetColor: selectedMealType == "Vegan"
                      ? Colors.white
                      : AppLightColor.blackColor,
                  background: selectedMealType == "Vegan"
                      ? Colors.red
                      : AppLightColor.whiteColor,
                  onPressed: () {
                    setState(() {
                      selectedMealType = "Vegan";
                      widget.onMealTypeSelected(selectedMealType);
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
                  widget: "Keto",
                  widgetColor: selectedMealType == "Keto"
                      ? Colors.white
                      : AppLightColor.blackColor,
                  background: selectedMealType == "Keto"
                      ? Colors.red
                      : AppLightColor.whiteColor,
                  onPressed: () {
                    setState(() {
                      selectedMealType = "Keto";
                      widget.onMealTypeSelected(selectedMealType);
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

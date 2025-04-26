import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class Warning extends StatelessWidget {
  const Warning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: const Text("Add Dish"),
        onPressed: () => _showAllergenDialog(context),
      ),
    ));
  }
}

void _showAllergenDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppLightColor.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: AppLightColor.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.warning_amber,
                            color: Colors.yellow[700]),
                      )),
                  const SizedBox(width: 8),
                  const Text(
                    'Allergen Warning',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppLightColor.greyColor1,
                    ),
                  ),
                ],
              ),
            ),

            // Shellfish Info
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.orange[50]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.close, color: Colors.yellow[700]),
                      )),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Shellfish',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Shrimp Pasta contains shellfish',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Message Box
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  border: Border(
                      left: BorderSide(color: Colors.yellow[700]!, width: 5)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'According to your profile, you have listed shellfish as an allergen. This dish contains ingredients that may cause an allergic reaction.',
                  style: TextStyle(fontSize: 14,color: Colors.grey),
                ),
              ),
            ),

            // Buttons
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppLightColor.greyColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.grey[200]!,style: BorderStyle.solid)),
                            backgroundColor: AppLightColor.backgroundColor),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Choose another',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: AppLightColor.mainColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // Handle 'add anyway' action
                      },
                      child: const Text(
                        'Add anyway',
                        style: TextStyle(color: AppLightColor.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

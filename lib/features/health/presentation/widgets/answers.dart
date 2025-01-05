import 'package:fitfat/features/health/presentation/widgets/custom_card_answer.dart';
import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(height:15),
        Row(
          children: [
            CustomCardAnswer(title: 'Lactose'),
             SizedBox(width:25),
            CustomCardAnswer(title: 'Peanuts')
          ],
        ),
         SizedBox(height:7),
         Row(
          children: [
            CustomCardAnswer(title: 'Shellfish'),
             SizedBox(width:25),
            CustomCardAnswer(title: 'Wheat')
          ],
        ),
         SizedBox(height:7),
        CustomCardAnswer(title: 'None')
      ],
    );
  }
}
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/chat/presentation/widgets/meal_card.dart';
import 'package:flutter/material.dart';

class BotChatBubble extends StatelessWidget {
  const BotChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width * 0.9;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.black12,
              blurRadius: 3,
              spreadRadius: 0,
            )
          ],
          color: AppLightColor.whiteColor1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: const MealCard(),
      ),
    );
  }
}

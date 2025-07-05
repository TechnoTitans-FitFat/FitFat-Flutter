import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/chat/data/models/chat_bot_model.dart';
import 'package:fitfat/features/chat/presentation/widgets/meal_card.dart';
import 'package:flutter/material.dart';

class BotChatBubble extends StatelessWidget {
  const BotChatBubble({super.key, required this.message});
  final ChatMessageModel message;

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
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.black12,
              blurRadius: 3,
              spreadRadius: 0,
            )
          ],
          color: context.theme.whiteColor1,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: message.meal != null
            ? MealCard(meal: message.meal!)
            : Text(
                message.message ?? '',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}

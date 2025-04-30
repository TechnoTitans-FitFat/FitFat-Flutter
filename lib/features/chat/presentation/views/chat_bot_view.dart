import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/features/chat/presentation/widgets/list_message_body.dart';
import 'package:fitfat/features/chat/presentation/widgets/send_message_field.dart';
import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppLightColor.backgroundColor,
      body: Column(
        children: [
          CustomAppBar(title: "FoodBot Assistant"),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListMessageBody(), //NoMessageBody(),
                ),
              ],
            ),
          ),
          SendMessageField(),
        ],
      ),
    );
  }
}

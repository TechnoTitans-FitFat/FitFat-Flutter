import 'package:fitfat/features/chat/presentation/widgets/sender_chat_bubble.dart';
import 'package:flutter/material.dart';

class ListMessageBody extends StatelessWidget {
  const ListMessageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return const SenderChatBubble(); //const BotChatBubble();
      },
    );
  }
}

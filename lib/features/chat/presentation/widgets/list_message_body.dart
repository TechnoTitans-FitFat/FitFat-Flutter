import 'package:fitfat/features/chat/data/chat_bot_cubit/chat_bot_cubit.dart';
import 'package:fitfat/features/chat/data/chat_bot_cubit/chat_bot_state.dart';
import 'package:fitfat/features/chat/data/models/chat_bot_model.dart';
import 'package:fitfat/features/chat/presentation/widgets/bot_chat_bubble.dart';
import 'package:fitfat/features/chat/presentation/widgets/sender_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMessageBody extends StatelessWidget {
  const ListMessageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      final state = context.watch<ChatBotCubit>().state;

    List<ChatMessageModel> messageList = [];

    bool isLoading = false;

    if (state is ChatBotSuccess ||
        state is ChatBotNoMealFound ||
        state is ChatBotFailure) {
      messageList = (state as dynamic).messageHistory;
    } else if (state is ChatBotLoading) {
      messageList = state.messageHistory;
      isLoading = true;
    }

    return ListView.builder(
      itemCount: isLoading ? messageList.length + 1 : messageList.length,
      itemBuilder: (context, index) {
        if (index < messageList.length) {
          final msg = messageList[index];
          return msg.isUser
              ? SenderChatBubble(message: msg.message ?? '')
              : BotChatBubble(message: msg);
        } else {
          // Loading indicator at the bottom
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
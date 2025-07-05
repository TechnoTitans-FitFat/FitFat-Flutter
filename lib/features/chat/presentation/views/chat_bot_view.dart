import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/features/chat/data/chat_bot_cubit/chat_bot_cubit.dart';
import 'package:fitfat/features/chat/data/chat_bot_cubit/chat_bot_state.dart';
import 'package:fitfat/features/chat/presentation/widgets/list_message_body.dart';
import 'package:fitfat/features/chat/presentation/widgets/no_message_body.dart';
import 'package:fitfat/features/chat/presentation/widgets/send_message_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          const CustomAppBar(title: "FoodBot Assistant"),
          Expanded(child: BlocBuilder<ChatBotCubit, ChatBotState>(
            builder: (context, state) {
              final messageHistory =
                  context.read<ChatBotCubit>().messageHistory;
              if (messageHistory.isEmpty) {
                return const NoMessageBody();
              } else {
                return const ListMessageBody();
              }
            },
          )),
          const SendMessageField(),
        ],
      ),
    );
  }
}

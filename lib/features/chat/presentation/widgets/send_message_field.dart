import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/chat/data/chat_bot_cubit/chat_bot_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageField extends StatefulWidget {
  const SendMessageField({
    super.key,
  });

  @override
  State<SendMessageField> createState() => _SendMessageFieldState();
}

class _SendMessageFieldState extends State<SendMessageField> {
  final TextEditingController _controller = TextEditingController();
  // final String userId;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: double.infinity,
      color: context.theme.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                cursorColor: context.theme.mainColor,
                decoration: InputDecoration(
                  hintText: "Type a message...",
                  hintStyle: AppStyles.textStyle13,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Colors.black12,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: context.theme.mainColor,
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Colors.black12,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                ),
              ),
            ),
            IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  context.theme.mainColor,
                ),
              ),
              onPressed: () {
                final text = _controller.text.trim();
                final userId = context.read<LoginCubit>().user?.id;
                if (text.isNotEmpty && userId != null) {
                  context.read<ChatBotCubit>().sendMessage(
                        userId: userId,
                        message: text,
                      );
                  _controller.clear();
                } else {
                  print("User ID is null or message is empty");
                }
              },
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.send_rounded,
                  color: context.theme.whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

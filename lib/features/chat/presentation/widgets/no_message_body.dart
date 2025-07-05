import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class NoMessageBody extends StatelessWidget {
  const NoMessageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/icons/chatbot.png"),
            height: 100,
            width: 100,
          ),
          Text(
            "Hi, I'm FoodBot!",
            style: AppStyles.textStyle24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Text(
              "I can help you find meals that match your preferences, dietary needs, or health conditions.",
              style: AppStyles.textStyle15.copyWith(
                color: context.theme.greyColor,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

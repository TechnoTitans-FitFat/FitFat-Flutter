import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.65,
          child:  Divider(
            color: context.theme.greyColor,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

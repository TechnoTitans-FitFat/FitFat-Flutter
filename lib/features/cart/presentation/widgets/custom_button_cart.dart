import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/presentation/views/payment_screen.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({super.key, required this.color, required this.text});

  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PaymentScreen()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size(219, 45),
      ),
      child: Text(
        text,
        style: AppStyles.textStyle16.copyWith(
            color: context.theme.whiteColor, fontWeight: FontWeight.w700),
      ),
    );
  }
}

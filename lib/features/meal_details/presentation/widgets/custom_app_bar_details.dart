import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarDetails extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:AppLightColor.transpernt,
      leading: Padding(
        padding: const EdgeInsets.only(left:16),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/back.png',height: 25,width: 25,fit: BoxFit.contain,)
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Image.asset('assets/icons/shoppingcart.png',height: 34,width: 34,fit: BoxFit.contain,),
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/cubit/clear_cart_cubit.dart';
import 'package:fitfat/features/cart/cubit/get_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarCart extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarCart({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppLightColor.backgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.textStyle24.copyWith(
          color: AppLightColor.mainColor,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppLightColor.backgroundColor,
              border: Border.all(color: AppLightColor.mainColor, width: 2),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppLightColor.mainColor,
                size: 18,
              ),
            ),
          ),
        ),
      ),
      actions: [
        BlocConsumer<ClearCartCubit, ClearState>(
            listener: (context, state) {
          if (state is ClearSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text((state).message)),
            );
            context.read<GetCartCubit>().getCart(context: context);
          } else if (state is ClearFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text((state).error)),
            );
          }
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<ClearCartCubit>().clear(context: context);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: AppLightColor.backgroundColor,
                  side: const BorderSide(
                      color: AppLightColor.mainColor, width: 2)),
              child: const Text(
                "Clear",
                style:
                    TextStyle(color: AppLightColor.mainColor, fontSize: 20),
              ),
            ),
          );
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

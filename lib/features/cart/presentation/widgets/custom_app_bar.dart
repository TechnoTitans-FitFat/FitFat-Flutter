import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
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
      backgroundColor: context.theme.backgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.textStyle24.copyWith(
          color: context.theme.mainColor,
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
              color: context.theme.backgroundColor,
              border: Border.all(color: context.theme.mainColor, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                Icons.arrow_back_ios,
                color: context.theme.mainColor,
                size: 18,
              ),
            ),
          ),
        ),
      ),
      actions: [
        BlocConsumer<ClearCartCubit, ClearState>(listener: (context, state) {
          if (state is ClearSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                context,
                "Success",
                "Clear Cart Success : ${state.message}",
                SnackBarType.success,
              ),
            );
            context.read<GetCartCubit>().getCart(context: context);
          } else if (state is ClearFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                context,
                "Error",
                "Clear Cart Faild : ${state.error}",
                SnackBarType.error,
              ),
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
                  backgroundColor: context.theme.backgroundColor,
                  side: BorderSide(color: context.theme.mainColor, width: 2)),
              child: Text(
                "Clear",
                style: TextStyle(color: context.theme.mainColor, fontSize: 20),
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

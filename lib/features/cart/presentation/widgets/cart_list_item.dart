import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/cubit/delete_cart_cubit.dart';
import 'package:fitfat/features/cart/cubit/get_cart_cubit.dart';
import 'package:fitfat/features/cart/data/models/get_cart_model.dart';
import 'package:fitfat/features/meal_details/data/card_cubit/decrement_cubit.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/increase_and_decrese_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListItem extends StatefulWidget {
  final CartItem item;
  final VoidCallback onCountChanged;

  const CartListItem(
      {super.key, required this.item, required this.onCountChanged});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.item.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          clipBehavior: Clip.none,
          elevation: 3,
          shadowColor: Colors.black,
          color: AppLightColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Image.network(widget.item.image, fit: BoxFit.cover),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.item.name,
                          style: AppStyles.textStyle16.copyWith(
                            color: AppLightColor.blackColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppLightColor.mainColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          '${widget.item.calories} cal',
                          style: AppStyles.textStyle12.copyWith(
                            color: AppLightColor.mainColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      /*
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xffFDE424),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "4.5",
                            style: AppStyles.textStyle16.copyWith(
                              color: AppLightColor.blackColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      */
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            '${widget.item.totalPrice}',
                            style: AppStyles.textStyle16.copyWith(
                              color: AppLightColor.mainColor,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'EGP',
                            style: AppStyles.textStyle16.copyWith(
                              color: AppLightColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.scale(
                              scale: 0.77,
                              child:
                                  BlocConsumer<DecrementCubit, DecrementState>(
                                      listener: (context, state) {
                                if (state is DecrementSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.message)),
                                  );
                                } else if (state is DecrementFailure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.error)),
                                  );
                                }
                              }, builder: (context, state) {
                                return IncreaseAndDecreseCount(
                                    count: count,
                                    onIncrement: () {
                                      setState(() {
                                        count++;
                                      });
                                      context.read<GetCartCubit>().getCart(
                                            context: context,
                                            id: widget.item.id,
                                            count: count,
                                          );
                                      widget.onCountChanged();
                                    },
                                    onDecrement: () {
                                      if (count > 1) {
                                        setState(() {
                                          context
                                              .read<DecrementCubit>()
                                              .decrement(
                                                  context: context,
                                                  productId:
                                                      widget.item.productId);
                                          count--;
                                        });
                                        context.read<GetCartCubit>().getCart(
                                              context: context,
                                              id: widget.item.id,
                                              count: count,
                                            );
                                        widget.onCountChanged();
                                      }
                                    });
                              })),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: -5,
            left: -5,
            child: BlocConsumer<DeleteCubit, DeleteState>(
                listener: (context, state) {
              if (state is DeleteSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text((state).message)),
                );
                context.read<GetCartCubit>().getCart(context: context);
              } else if (state is DeleteFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text((state).error)),
                );
              }
            }, builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  context.read<DeleteCubit>().delete(
                      context: context, productId: widget.item.productId);
                  print("prodeuct id: ${widget.item.productId}");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppLightColor.blackColor.withOpacity(.25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: AppLightColor.whiteColor),
                ),
              );
            })),
      ],
    );
  }
}

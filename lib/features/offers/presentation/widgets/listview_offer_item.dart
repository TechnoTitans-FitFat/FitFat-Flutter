import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/presentation/views/details_view.dart';
import 'package:fitfat/features/menu/data/cart_cubit/cart_cubit.dart';
import 'package:fitfat/features/offers/data/model/offer_model.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListviewOfferItem extends StatelessWidget {
  const ListviewOfferItem({super.key, required this.item});
  final OfferModel item;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsView(
                  mealId: item.id,
                  isMenu: false,
                ),
              ),
            );
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.black,
            color: context.theme.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: context.theme.whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsView(
                                mealId: item.id,
                                isMenu: true,
                              ),
                            ),
                          );
                        },
                        child: Image.network(item.image, fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: AppStyles.textStyle16.copyWith(
                            color: context.theme.blackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: context.theme.mainColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '${item.calories} cal',
                            style: AppStyles.textStyle12.copyWith(
                              color: context.theme.mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xffFDE424),
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item.rating.toStringAsFixed(1),
                              style: AppStyles.textStyle16.copyWith(
                                color: context.theme.blackColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              item.price.toString(),
                              style: AppStyles.textStyle16.copyWith(
                                color: context.theme.blackColor.withOpacity(.2),
                                decoration: TextDecoration.lineThrough,
                                decorationColor:
                                    context.theme.blackColor.withOpacity(.2),
                                decorationThickness: 1.5,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'EGP',
                              style: AppStyles.textStyle16.copyWith(
                                color: context.theme.blackColor.withOpacity(.2),
                                decoration: TextDecoration.lineThrough,
                                decorationColor:
                                    context.theme.blackColor.withOpacity(.2),
                                decorationThickness: 1.5,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.offerPrice.toString(),
                                  style: AppStyles.textStyle16.copyWith(
                                    color: context.theme.mainColor,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'EGP',
                                  style: AppStyles.textStyle16.copyWith(
                                    color: context.theme.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                context.read<CartCubit>()
                                  ..productId = item.id
                                  ..quantity = 1
                                  ..addCartAndIncrement(context: context);
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset(Assets.icons.add.path),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 9,
            left: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppLightColor.mainColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Text(
                  '15% OFF',
                  style: AppStyles.textStyle14.copyWith(
                    color: AppLightColor.whiteColor,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

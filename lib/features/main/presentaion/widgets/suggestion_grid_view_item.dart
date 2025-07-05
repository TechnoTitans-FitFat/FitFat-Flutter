import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/presentation/views/details_view.dart';
import 'package:fitfat/features/menu/data/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionGridViewItem extends StatelessWidget {
  const SuggestionGridViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.calories,
    required this.id,
  });

  final String imageUrl;
  final String title;
  final double price;
  final String calories;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.whiteColor,
        boxShadow: [
          BoxShadow(
            color: context.theme.blackColor.withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsView(
                              mealId: id,
                            )));
              },
              child: Hero(
                tag: imageUrl,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: context.theme.blackColor.withOpacity(0.25),
                        blurRadius: 3,
                        offset: const Offset(4, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppStyles.textStyle16.copyWith(
                color: context.theme.blackColor,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: context.theme.mainColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('$calories cal',
                        style: AppStyles.textStyle12.copyWith(
                          color: context.theme.mainColor,
                          fontSize: MediaQuery.of(context).size.width * 0.034,
                        )),
                  ),
                ),
                const Spacer(),
              ],
            ),
            //const SizedBox(height: 8),
            Row(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(price.toString(),
                      style: AppStyles.textStyle16.copyWith(
                        color: context.theme.mainColor,
                        fontSize: MediaQuery.of(context).size.width * 0.041,
                      )),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(" EGP",
                      style: AppStyles.textStyle16.copyWith(
                        color: context.theme.blackColor,
                        fontSize: MediaQuery.of(context).size.width * 0.041,
                      )),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    context.read<CartCubit>()
                      ..productId = id
                      ..quantity = 1
                      ..addCartAndIncrement(context: context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.theme.mainColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.add,
                        color: context.theme.whiteColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

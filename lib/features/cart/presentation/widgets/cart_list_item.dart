import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/cart/data/models/cart_model.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/increase_and_decrese_count.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatefulWidget {
  final CartModel item;
  final VoidCallback onCountChanged; 
  const CartListItem({super.key, required this.item, required this.onCountChanged});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  int count = 1;
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
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.all(Radius.circular(15))),
                  child: Image.asset(widget.item.image, fit: BoxFit.cover),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        style: AppStyles.textStyle16.copyWith(
                          color: AppLightColor.blackColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal:15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppLightColor.mainColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '400 cal',
                            style: AppStyles.textStyle12.copyWith(
                              color: AppLightColor.mainColor,
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
                           widget.item.rating.toString(),
                          style: AppStyles.textStyle16.copyWith(
                            color: AppLightColor.blackColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                               ((count * widget.item.price).toInt()).toString(),
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
                        Transform.scale(
                           scale: 0.77,
                          child: IncreaseAndDecreseCount(
                          count: count,
                          onIncrement: () {
                            setState(() {
                              count++;
                               widget.item.count = count;
                            });
                            widget.onCountChanged();
                          },
                          onDecrement: () {
                            setState(() {
                              if (count > 1) {
                                count--;
                                widget.item.count = count;
                              }
                            });
                            widget.onCountChanged();
                          },
                                              ),
                        )
                      ],
                    )
                    ]
                  )
                )
            ],
          ),
        ),
          ),
          Positioned(
             top: -5,
             left: -5,
             child:Container(
              decoration: BoxDecoration(
                color: AppLightColor.blackColor.withOpacity(.25),
                shape: BoxShape.circle
              ),
              child: Icon(Icons.close,color: AppLightColor.whiteColor,),
             ) ,
          )
      ],
      
    );
  }
}
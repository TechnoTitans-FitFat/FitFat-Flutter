import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CustomMealDatails extends StatefulWidget {
  const CustomMealDatails({
    super.key,
    required this.title,
    required this.caloreis,
    required this.rating,
    required this.cookingTime,
  });
  final String title;
  final String caloreis;
  final double rating;
  final String cookingTime;

  @override
  State<CustomMealDatails> createState() => _CustomMealDatailsState();
}

class _CustomMealDatailsState extends State<CustomMealDatails> {
   bool _isTapped = false;
     void _tappedImage() {
    setState(() {
      _isTapped = !_isTapped; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppStyles.textStyle24,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate,
                    color: Colors.yellow,
                  ),
                  Text(
                    widget.rating.toString(),
                    style: AppStyles.textStyle16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.local_fire_department,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.caloreis,
                    style: AppStyles.textStyle16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.schedule,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.cookingTime,
                    style: AppStyles.textStyle16,
                  )
                ],
              )
            ],
          ),
        ),
        GestureDetector(
          onTap:_tappedImage,
          child: Image.asset(
            _isTapped?  Assets.icons.liked.path : Assets.icons.component5.path,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}

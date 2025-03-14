import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/data/models/meal_details_model.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/custom_app_bar_details.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/custom_meal_datails.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/nutrients_list.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({
    super.key,
    required this.meal,
  });

  final MealDetailsModel meal;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
    
    final DraggableScrollableController _scrollController =
      DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.size < 0.97) {
      Future.delayed(const Duration(milliseconds: 350), () {
        _scrollController.animateTo(
          0.98, 
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Meal Ingredients: ${widget.meal.ingredients}");
    return SingleChildScrollView(
       physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
        Container(
          height: 370,
          width: double.infinity,
          color: AppLightColor.secondColor,
          child: Center(
            child: Hero(
              tag: widget.meal.image,
              child: Image.network(
                widget.meal.image,
                height: 370,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child:CustomAppBarDetails() 
          ),      
        Positioned(
          top: 300,
          left: 0,
          right: 0,
          bottom: 0,
          child: DraggableScrollableSheet(
             controller: _scrollController, 
             initialChildSize: .98, 
             minChildSize: 0.85, 
             maxChildSize: 0.99,
             snap: true,
             snapSizes: [0.85, 0.98],
             expand: false,
               builder: (context, scrollController) {
                 return Container(
              decoration: const BoxDecoration(
                  color: AppLightColor.whiteColor1,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: SingleChildScrollView(
                  controller: scrollController, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomMealDatails(
                        title: widget.meal.name,
                        caloreis: '${widget.meal.calories} cal',
                        cookingTime: widget.meal.cookingTime,
                        rating: widget.meal.rating,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Nutrients',
                          style: AppStyles.textStyle24.copyWith(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 18),
                      NutrientsList(
                        meal: widget.meal,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text('Ingredients',
                            style: AppStyles.textStyle24.copyWith(fontSize: 20)),
                      ),
                      const SizedBox(height: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.meal.ingredients.isNotEmpty
                            ? widget.meal.ingredients
                                .map((ingredient) => Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 4),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            " •     ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            child: Text(
                                              ingredient,
                                              style: AppStyles.textStyle16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList()
                            : [
                                Text(
                                  "No ingredients available",
                                  style: AppStyles.textStyle16
                                      .copyWith(color: Colors.red),
                                )
                              ], // Show message if empty
                      ),
                    ],
                  ),
                ),
              ),
            );
               }
          ),
        ),
                ]
              ),
      ),
    );
  }
}

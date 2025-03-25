import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_card_list_view_item.dart';
class CustomListView extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const CustomListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = DietModel.fromJson(items[index]);

        // ✅ Get first diet type safely or set "Unknown"
       String dietType = item.diet.isNotEmpty ? item.diet.first : "Unknown";

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: CustomCardListViewItem(
            title: item.name,
           imagePath: (item.image.isNotEmpty) ? item.image : 'https://via.placeholder.com/150',
            type: dietType, // ✅ Use the first diet type safely
            price: item.price,
            calories: item.calories.toString(),
            rating: item.rating,
            isFavourite: false,
            onFavouriteTap: () {},
          ),
        );
      },
    );
  }
}

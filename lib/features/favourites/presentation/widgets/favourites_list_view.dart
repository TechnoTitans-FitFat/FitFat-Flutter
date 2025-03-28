/*import 'package:fitfat/features/main/presentaion/widgets/custom_card_list_view_item.dart';
import 'package:flutter/material.dart';

class FavouritesListView extends StatelessWidget {
  const FavouritesListView({super.key, required this.items});
  final List<Map<String, dynamic>> items;
  @override

  Widget build(BuildContext context,) {
      debugPrint("FavouritesListView استلمت: ${items.toString()}");


    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: CustomCardListViewItem(
            title: item['title'],
            imagePath: item['imagePath'],
            type: item['type'],

           calories: item['calories'] is num
    ? (item['calories'] as num).toDouble()
    : double.tryParse(item['calories'].toString()) ?? 0.0,

            calories: item['calories'],
            showType: item['showType'] ?? true,
            price: item['price'] is num
                ? (item['price'] as num).toDouble()
                : double.tryParse(item['price'].toString()) ?? 0.0,
            isFavourite: item['favourite'] ?? false,
            onFavouriteTap: item['onFavouriteTap'],
            rating: item['rating'],
          ),
        );
      },
    );
  }
}

*/

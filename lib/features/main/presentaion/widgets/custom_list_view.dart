import 'package:flutter/material.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_card_list_view_item.dart';

class CustomListView extends StatelessWidget {
  final List<Map<String, dynamic>> items;
    

  const CustomListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
            child: CustomCardListViewItem(
              title: item['title'],
              imagePath: item['imagePath'],
              type: item['type'],
              calories: item['calories'],
              showType: item['showType'] ?? true, 
              price: item['price'],
              isFavourite: item['favourite'] ?? false,
            ),
          );
        },
      ),
    );
  }
}

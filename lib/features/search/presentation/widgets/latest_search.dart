import 'package:fitfat/features/search/presentation/widgets/latest_search_item.dart';
import 'package:flutter/material.dart';

class LatestSearch extends StatelessWidget {
  const LatestSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
            children: [
              SizedBox(height: 12,), 
              LatestSearchItem(title: 'Tuna Crunch'),
              SizedBox(height: 8,), 
              LatestSearchItem(title: 'Rustic Duck'),  
              SizedBox(height: 8,), 
              LatestSearchItem(title: 'Grilled Steak'),  
              SizedBox(height: 8,), 
              LatestSearchItem(title: 'Pad Tahi'),          
            ],
          );
  }
}
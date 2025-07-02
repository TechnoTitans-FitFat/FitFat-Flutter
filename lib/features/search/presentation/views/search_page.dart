import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/search/presentation/widgets/search_page_body.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body:const SearchPageBody()
    );
  }
}
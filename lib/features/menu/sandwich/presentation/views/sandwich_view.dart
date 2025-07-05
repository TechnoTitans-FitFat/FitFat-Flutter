import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/menu/sandwich/presentation/widgets/listview_sandwich.dart';
import 'package:flutter/material.dart';

class SandwichView extends StatelessWidget {
  const SandwichView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: const CustomAppBar(title: 'Sandwiches'),
        body:const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children:  [
              CustomTextFiledSearch(),
              Expanded(child: ListviewSandwich())
            ],
          ),
        ));
  }
}
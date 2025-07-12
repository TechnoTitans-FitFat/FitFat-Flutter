import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/menu/meat/presentation/widgets/list_view_meat.dart';
import 'package:flutter/material.dart';

class MeatView extends StatelessWidget {
  const MeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: const CustomAppBar(title: 'Meat'),
        body:const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children:  [
              CustomTextFiledSearch(),
              Expanded(child: ListViewMeat())
            ],
          ),
        ));
  }
}

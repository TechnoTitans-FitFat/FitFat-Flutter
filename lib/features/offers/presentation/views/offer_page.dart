import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/offers/presentation/widgets/listview_offer.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Offer'),
      backgroundColor: AppLightColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12 ),
        child: Column(
          children: [
            CustomTextFiledSearch(),
            Expanded(child: ListviewOffer())
          ],
        ),
      ),
    );
  }
}
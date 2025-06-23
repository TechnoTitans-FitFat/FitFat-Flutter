import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitfat/features/offers/presentation/views/offer_page.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AutoScrollPanner extends StatelessWidget {
   AutoScrollPanner({super.key});


final List<String> images = [
    Assets.images.offer1.path,
    Assets.images.offer2.path,
    Assets.images.offer3.path,
    Assets.images.offer4.path
  ];
  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OfferPage()));
      },
      child: CarouselSlider(
        options: CarouselOptions(
          height: screenHeight*.21,
          autoPlay: true,
          viewportFraction: 1.0,
          autoPlayInterval: const Duration(seconds: 3), 
          autoPlayAnimationDuration: const Duration(milliseconds: 800), 
          enlargeCenterPage: true,
        ),
        items: images.map((item) {
          return Container(
            width: MediaQuery.of(context).size.width*.88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(image: AssetImage(item), fit: BoxFit.cover),
            ),
          );
        }).toList(),
      ),
    );
  }
}
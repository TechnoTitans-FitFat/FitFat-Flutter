import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AutoScrollPanner extends StatelessWidget {
   AutoScrollPanner({super.key});


final List<String> images = [
    'imges/offer1.png',
    'imges/offer2.png',
    'imges/offer3.png',
    'imges/offer4.png'
  ];
  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.of(context).size.height;
    return CarouselSlider(
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
    );
  }
}
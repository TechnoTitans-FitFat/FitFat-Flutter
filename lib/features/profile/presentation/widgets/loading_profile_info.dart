import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProfileInfo extends StatelessWidget {
  const LoadingProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 150, height: 16, color: Colors.grey.shade300),
          const SizedBox(height: 20),
          Container(width: 100, height: 14, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(width: 100, height: 14, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(width: 100, height: 14, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 14, color: Colors.grey.shade300),
                Container(width: 80, height: 14, color: Colors.grey.shade300),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

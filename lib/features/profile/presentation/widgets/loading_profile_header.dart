import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProfileHeader extends StatelessWidget {
  const LoadingProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 120,
            height: 18,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 4),
          Container(
            width: 150,
            height: 14,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}

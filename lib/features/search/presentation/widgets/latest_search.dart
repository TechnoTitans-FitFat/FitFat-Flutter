import 'package:flutter/material.dart';

class LatestSearch extends StatelessWidget {
  final List<String> recent;

  const LatestSearch({super.key, this.recent = const []});

  @override
  Widget build(BuildContext context) {
    if (recent.isEmpty) {
      return const Text("No recent searches.");
    }

    return Wrap(
      spacing: 8,
      children: recent.map((text) {
        return Chip(label: Text(text));
      }).toList(),
    );
  }
}

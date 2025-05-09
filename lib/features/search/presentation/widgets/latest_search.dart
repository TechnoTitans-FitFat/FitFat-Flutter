import 'package:fitfat/features/search/presentation/widgets/search_storage.dart';
import 'package:flutter/material.dart';


class LatestSearch extends StatefulWidget {
  const LatestSearch({super.key});

  @override
  State<LatestSearch> createState() => _LatestSearchState();
}

class _LatestSearchState extends State<LatestSearch> {
  List<String> recent = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final history = await SearchStorage.loadSearchHistory();
    setState(() {
      recent = history.name;
    });
  }

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

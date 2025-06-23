import 'package:fitfat/features/search/presentation/widgets/latest_search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/search/data/search_history/search_history_cubit.dart';

class LatestSearch extends StatelessWidget {
  const LatestSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchHistoryCubit, SearchHistoryState>(
      builder: (context, state) {
        if (state is SearchHistoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchHistoryLoaded) {
          final historyList = state.history;

          if (historyList.isEmpty) {
            return const Text("No recent searches");
          }

          return Column(
            children: historyList.map((title) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: LatestSearchItem(title: title),
              );
            }).toList(),
          );
        } else if (state is SearchHistoryFailure) {
          return Text(state.message);
        } else {
          return const SizedBox.shrink(); // in case of initial state
        }
      },
    );
  }
}

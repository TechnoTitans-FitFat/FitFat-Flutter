import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_history_state.dart';

class SearchHistoryCubit extends Cubit<SearchHistoryState> {
  final ApiConsumer apiConsumer;

  SearchHistoryCubit(this.apiConsumer) : super(SearchHistoryInitial());

  List<String> _history = [];

  Future<void> getLatestSearches(BuildContext context) async {
  emit(SearchHistoryLoading());
  try {
    final token = context.read<LoginCubit>().user?.token;
    if (token == null) {
      emit(SearchHistoryFailure("User not logged in"));
      return;
    }

    final response = await apiConsumer.get(
      EndPoint.searchHistory,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    _history = List<String>.from(response['searchHistory']['name']);
    emit(SearchHistoryLoaded(_history));
  } catch (e) {
    emit(SearchHistoryFailure("Failed to load search history"));
  }
}
}
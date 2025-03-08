import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/suggestions/data/models/suggestions_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'suggestions_state.dart';

class SuggestionsCubit extends Cubit<SuggestionsState> {
  final ApiConsumer apiConsumer;
  int page = 1;
  final int limit = 10;
  bool hasMore = true;
  //List<SuggestionsModel> allData = [];
   List<List<SuggestionsModel>> paginatedData = []; 
  int currentPageIndex = 0;

  SuggestionsCubit(this.apiConsumer) : super(SuggestionsInitial());

  void fetchSuggestionsData({bool isInitialLoad = false}) async{
    if (!hasMore) return;

    if (isInitialLoad) {
      page = 1;
      hasMore = true;
      paginatedData.clear();
      currentPageIndex = 0;
      debugPrint("Before Emitting Loading State.......");
      emit(SuggestionsLoading());
      debugPrint("After Emitting Loading State.......");
    }
        final String url = "${EndPoint.suggestions}${EndPoint.suggestions.contains('?') ? '&' : '?'}page=$page&limit=$limit";

  debugPrint("Requesting: $url"); 
       try {
      final response = await apiConsumer.get(url);
 
 debugPrint("Fetching page: $page"); 
  debugPrint("API Response: $response");

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        List<SuggestionsModel> newData = (response['recipes'] as List)
            .map((item) => SuggestionsModel.fromJson(item))
            .toList();
            debugPrint("Fetched ${newData.length} new items");
            int totalPages = response['totalPages'] ?? 1; 
            int currentPage = response['currentPage'] ?? 1;

        if (newData.isEmpty || currentPage >= totalPages) {
          hasMore = false;
        }else{
          page++;
        }
          paginatedData.add(newData);
        emit(SuggestionsSuccess(data: paginatedData[currentPageIndex]));
      } else {
        emit(SuggestionsFailure(errMessage: "Invalid data format"));
      }
    } on ServerException catch (e) {
      emit(SuggestionsFailure(errMessage: e.errModel.errMessage));
    }
  }
   void nextPage() {
    if (currentPageIndex < paginatedData.length - 1) {
      currentPageIndex++;
      emit(SuggestionsSuccess(data: paginatedData[currentPageIndex])); 
    }
  }

  void prevPage() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
      emit(SuggestionsSuccess(data: paginatedData[currentPageIndex])); 
    }
  }
}


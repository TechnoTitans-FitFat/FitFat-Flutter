part of 'search_cubit.dart';

@immutable
abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<SearchRecipeModel> results;
  SearchSuccess(this.results);

  @override
  List<Object> get props => [results];
}

class SearchFailure extends SearchState {
  final String errMessage;
  SearchFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}

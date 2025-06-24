part of 'search_history_cubit.dart';

abstract class SearchHistoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchHistoryInitial extends SearchHistoryState {}

class SearchHistoryLoading extends SearchHistoryState {}

class SearchHistoryLoaded extends SearchHistoryState {
  final List<String> history;

  SearchHistoryLoaded(this.history);

  @override
  List<Object> get props => [history];
}

class SearchHistoryFailure extends SearchHistoryState {
  final String message;

  SearchHistoryFailure(this.message);

  @override
  List<Object> get props => [message];
}

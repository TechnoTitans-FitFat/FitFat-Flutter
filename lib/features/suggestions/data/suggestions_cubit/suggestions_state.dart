part of 'suggestions_cubit.dart';

@immutable
abstract class SuggestionsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SuggestionsInitial extends SuggestionsState {}

class SuggestionsLoading extends SuggestionsState {}

class SuggestionsSuccess extends SuggestionsState {
  final List<SuggestionsModel> data;

  SuggestionsSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class SuggestionsFailure extends SuggestionsState {
  final String errMessage;

  SuggestionsFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}

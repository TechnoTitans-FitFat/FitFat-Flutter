part of 'main_screen_cubit.dart';

@immutable

abstract class MainScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {}

class MainScreenLoading extends MainScreenState {}

class MainScreenSucess extends MainScreenState {
  final List<MainScreenModel> data;

   MainScreenSucess({required this.data});

  @override
  List<Object> get props => [data];
}

class MainScreenFailure extends MainScreenState {
  final String errMessage;
  MainScreenFailure({required this.errMessage});

 @override
  List<Object> get props => [errMessage];
}
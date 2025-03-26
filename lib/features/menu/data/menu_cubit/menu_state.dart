part of 'menu_cubit.dart';

@immutable

abstract class MenuState extends Equatable {
  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuSucess extends MenuState {
  final List<MenuModel> data;

  MenuSucess({required this.data});

  @override
  List<Object> get props => [data];
}

class MenuFailure extends MenuState {
  final String errMessage;
  MenuFailure({required this.errMessage});

 @override
  List<Object> get props => [errMessage];
}
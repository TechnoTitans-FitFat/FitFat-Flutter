part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState extends Equatable {

  @override
  List<Object> get props => [];
}

 class FavouritesInitial extends FavouritesState {}

 class FavouritesLoading extends FavouritesState {}

 class FavouritesSuccess extends FavouritesState {

  final List<FavouritesModel> data;

  FavouritesSuccess({required this.data});

  @override
  List<Object> get props => [data];
 }

 class FavouritesFailure extends FavouritesState{
   final String errMessage;

  FavouritesFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
 }

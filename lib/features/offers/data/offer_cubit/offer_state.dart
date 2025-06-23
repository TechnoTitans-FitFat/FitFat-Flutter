part of 'offer_cubit.dart';

@immutable

abstract class OfferState extends Equatable {
  @override
  List<Object> get props => [];
}

class OfferInitial extends OfferState {}

class OfferLoading extends OfferState {}

class OfferSucess extends OfferState {
  final List<OfferModel> data;

   OfferSucess({required this.data});

  @override
  List<Object> get props => [data];
}

class OfferFailure extends OfferState {
  final String errMessage;
  OfferFailure({required this.errMessage});

 @override
  List<Object> get props => [errMessage];
}
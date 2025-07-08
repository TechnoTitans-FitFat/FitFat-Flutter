import 'package:fitfat/features/profile/data/model/profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfileModel userProfile;

  const UserProfileLoaded({required this.userProfile});

  @override
  List<Object> get props => [userProfile];
}

class UserProfileError extends UserProfileState {
  final String message;
  final String? errorCode;

  const UserProfileError({required this.message, this.errorCode});

  @override
  List<Object> get props => [message, errorCode ?? ''];
}

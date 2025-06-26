import 'package:equatable/equatable.dart';
import 'package:fitfat/features/profile/data/model/profile_model.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object?> get props => [];
}

class UserProfileInitial extends UserProfileState {
  const UserProfileInitial();
}

class UserProfileLoading extends UserProfileState {
  const UserProfileLoading();
}

class UserProfileLoaded extends UserProfileState {
  final UserProfileModel userProfile;

  const UserProfileLoaded({required this.userProfile});

  @override
  List<Object?> get props => [userProfile];
}

class UserProfileError extends UserProfileState {
  final String message;
  final String? errorCode;

  const UserProfileError({
    required this.message,
    this.errorCode,
  });

  @override
  List<Object?> get props => [message, errorCode];
}

class UserProfileUpdating extends UserProfileState {
  final UserProfileModel currentProfile;

  const UserProfileUpdating({required this.currentProfile});

  @override
  List<Object?> get props => [currentProfile];
}

class UserProfileUpdated extends UserProfileState {
  final UserProfileModel updatedProfile;

  const UserProfileUpdated({required this.updatedProfile});

  @override
  List<Object?> get props => [updatedProfile];
}

class UserProfileUpdateError extends UserProfileState {
  final String message;
  final UserProfileModel currentProfile;

  const UserProfileUpdateError({
    required this.message,
    required this.currentProfile,
  });

  @override
  List<Object?> get props => [message, currentProfile];
}

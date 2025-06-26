// cubit/user_profile_cubit.dart

import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/model/profile_model.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final Dio _dio;
  static const String _baseUrl = 'https://fitfattt.azurewebsites.net/api/users';

  UserProfileCubit({Dio? dio})
      : _dio = dio ?? Dio(),
        super(const UserProfileInitial());

  /// Fetch user profile data
  Future<void> getUserProfile({String? userId, required String token}) async {
    try {
      emit(const UserProfileLoading());

      final String url = userId != null ? '$_baseUrl/$userId' : _baseUrl;

      final response = await _dio.get(url,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        final userProfile = UserProfileModel.fromJson(response.data);
        emit(UserProfileLoaded(userProfile: userProfile));
      } else {
        emit(UserProfileError(
          message: 'Failed to load user profile',
          errorCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      emit(UserProfileError(
        message: e.toString(),
        errorCode: e.response?.statusCode.toString(),
      ));
    } catch (e) {
      emit(UserProfileError(
        message: 'An unexpected error occurred: ${e.toString()}',
      ));
    }
  }
}

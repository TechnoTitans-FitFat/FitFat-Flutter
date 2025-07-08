import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:fitfat/features/profile/data/model/profile_model.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final Dio _dio;
  static const String _baseUrl = 'https://fitfattt.azurewebsites.net/api/users';

  UserProfileCubit({Dio? dio})
      : _dio = dio ?? Dio(),
        super(UserProfileInitial());

  // Fetch user profile data
  Future<void> getUserProfile({String? userId, required String token}) async {
    try {
      emit(UserProfileLoading());

      final String url = userId != null ? '$_baseUrl/$userId' : _baseUrl;

      final response = await _dio.get(
        url,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      print(response.data);
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
        message: e.response?.data['message']?.toString() ?? 'Network error',
        errorCode: e.response?.statusCode.toString(),
      ));
    } catch (e) {
      emit(UserProfileError(
        message: 'An unexpected error occurred: ${e.toString()}',
      ));
    }
  }
}

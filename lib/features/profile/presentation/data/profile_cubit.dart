import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/profile/presentation/models/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'user_states.dart';

class UserCubit extends Cubit<UserState> {
  XFile? profilePic;
  final ApiServices api;
  String? token;

  UserModel? currentUser;

  UserCubit(this.api) : super(UserInitial());

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfile());
  }

  // Future<void> userProfile({required String token, context}) async {
  //   try {
  //     emit(UserLoading());
  //     // final token = context != null
  //     //     ? context.read<LoginCubit>().user?.token
  //     //     : null;
  //
  //     print(token);
  //     if (token.isEmpty) {
  //       emit(UserError('User not logged in'));
  //       return;
  //     }
  //     final response = await api.get(
  //       EndPoint.profile,
  //       options: Options(headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json',
  //       }),
  //     );
  //
  //     debugPrint("Server response: $response");
  //     currentUser = UserModel.fromJson(response.data);
  //     emit(UserLoaded(currentUser!));
  //   } on ServerException catch (e) {
  //     emit(UserError(e.errModel.errMessage));
  //   } catch (e) {
  //     emit(UserError('An error occurred'));
  //     debugPrint(e.toString());
  //   }
  // }


  userProfile({required String token}) async {
    emit(UserLoading());
        // final token = context != null
        //     ? context.read<LoginCubit>().user?.token
        //     : null;

        print(token);
        if (token!.isEmpty) {
          emit(UserError('User not logged in'));
          return;
        }
        final response = await api.getRequest(
            endpoint: EndPoint.profile,
          token: token, 
        );

        debugPrint("Server response: $response");
        currentUser = UserModel.fromJson(response.data);
        emit(UserLoaded(currentUser!));
  }
}

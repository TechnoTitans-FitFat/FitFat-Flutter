import 'package:bloc/bloc.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/profile/presentation/models/profile_model.dart';
import 'package:image_picker/image_picker.dart';

part 'user_states.dart';

class UserCubit extends Cubit<UserState> {
  XFile? profilePic;
  final ApiConsumer api;
  String? token;

  UserCubit(this.api) : super(UserInitial());

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfile());
  }

  userProfile()async{
    try {
      emit(UserLoading());
      final response = await api.get(EndPoint.profile);
      emit(UserLoaded(UserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(UserError(e.errModel.errMessage));
    }catch(e){
      print(e);
    }
  }

}
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/health_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_services.dart';
part 'health_info_states.dart';
class GetHealthInfoCubit extends Cubit<GetHealthInfoState> {
  GetHealthInfoCubit( this.api) : super(UserInitial());

  final ApiServices api;
  String? id;
  getUserProfile({required BuildContext context}) async {
    emit(UserLoading());
    try {
      final id = BlocProvider.of<LoginCubit>(context, listen: false).user?.id;
      print(id);
      if (id == null || id.isEmpty) {
        emit(UserError("User ID is missing"));
        return;
      }

      final response = await api.getRequest(
        endpoint: "${EndPoint.getHealthInfo}$id",
        //endpoint: 'https://fitfat-backend.up.railway.app/api/healthInfo/67e5eb180b8e8a027bd2d5a7'
      );
      final data = response.data;
      if (data["status"] == true) {
        final healthInfo = GetHealthModel.fromJson(data);
        emit(UserLoaded(healthInfo));
      } else {
        emit(UserError("Failed to fetch health info"));
      }
    }  catch (e) {
      emit(UserError("Error: Failed"));
      print(e.toString());
    }
  }
}

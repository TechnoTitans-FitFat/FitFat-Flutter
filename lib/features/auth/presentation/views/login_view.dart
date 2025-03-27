// ignore_for_file: must_be_immutable

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/login_view_body.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  late String? email, password;

  late GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
      if (state is LoginLoading) {
      } else if (state is LoginSucess) {
        ShowDialog(context, 'Great to see you again');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ));
      } else if (state is LoginFalier) {
        showSnackBar(context, state.errorMassage);
      }
    }, builder: (context, state) {
      return const Scaffold(
          backgroundColor: AppLightColor.whiteColor, body: LoginViewBody());
    });
  }
}

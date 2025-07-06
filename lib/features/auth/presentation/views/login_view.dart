// ignore_for_file: must_be_immutable

import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/login_view_body.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Cubit/blocs/auth_bloc/login_state.dart';

class Login extends StatelessWidget {
  Login({super.key});

  late String? email, password;

  late GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              context,
              "Success",
              "Great to see you again",
              SnackBarType.success,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              context,
              "Error",
              "Unexpected error occurred!",
              SnackBarType.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.theme.whiteColor,
          body: const LoginViewBody(),
        );
      },
    );
  }
}

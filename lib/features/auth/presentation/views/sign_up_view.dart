import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpLoading) {
        } else if (state is SignUpSucess) {
          Navigator.pushNamed(
            context,
            "/otpScreen",
            arguments: {
              "email": state.email,
              "userId": state.userId,
            },
          );
        } else if (state is SignUpFalier) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMassage.toString())),
          );
        }
      },
      builder: (BuildContext context, SignUpStates state) {
        return Scaffold(
          backgroundColor: AppLightColor.whiteColor,
          body: Stack(
            children: [
              SignUpViewBody(
                tabController: tabController,
              ),
            ],
          ),
        );
      },
    );
  }
}

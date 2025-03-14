import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/views/personal_information_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, SignUpStates>(
      listener: (BuildContext context, state) {
        if (state is SignUpLoading) {
          // Loading state handling
        } else if (state is SignUpSucess) {
          ShowDialog(
              context, 'Welcome to the family!\n Your journey starts now');
          final userId = context.read<RegisterCubit>().user?.userId;

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonalInformationView(userId: userId!),
              ));
        } else if (state is SignUpFalier) {
          showSnackBar(context, state.errorMassage);
        }
      },
      builder: (BuildContext context, SignUpStates state) => const Scaffold(
          backgroundColor: AppLightColor.whiteColor, body: SignUpViewBody()),
    );
  }
}

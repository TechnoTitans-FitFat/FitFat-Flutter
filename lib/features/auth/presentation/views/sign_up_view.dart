import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_button.dart';
import 'package:fitfat/features/auth/presentation/widgets/sign_up_view_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/customs/custom_textfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    String? email, password, confirm;

    bool isLoading = false;
    return BlocConsumer<RegisterCubit, SignUpStates>(
      listener: (BuildContext context, state) {
        if (state is SignUpLoading) {
        } else if (state is SignUpSucess) {
          ShowDialog(
              context, 'Welcome to the family!\n Your journey starts now');
        } else if (state is SignUpFalier) {
          showSnackBar(context, state.errorMassage);
        }
      },
      builder: (BuildContext context, SignUpStates state) => Scaffold(
        backgroundColor: AppLightColor.whiteColor,
        body: const SignUpViewBody()
      ),
    );
  }
}

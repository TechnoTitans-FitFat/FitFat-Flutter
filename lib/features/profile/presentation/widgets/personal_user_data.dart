import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/profile/presentation/data/profile_cubit.dart';
import 'package:fitfat/features/profile/presentation/widgets/image_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalUserData extends StatefulWidget {
  const PersonalUserData({super.key});

  @override
  State<PersonalUserData> createState() => _PersonalUserDataState();
}

class _PersonalUserDataState extends State<PersonalUserData> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<UserCubit>().userProfile(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserError) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is UserLoaded) {
          final user = state.user;
          return Column(
            children: [
              const Center(
                child: ImageUpload(),
              ),
              const SizedBox(height: 15),
              Text(
                user.username,
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
              ),
              Text(
                user.email,
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
              )
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
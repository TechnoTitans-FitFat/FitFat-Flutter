import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/profile/presentation/data/profile_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/profile_model.dart';
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
  void initState() {
    super.initState();
      context.read<UserCubit>().userProfile(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTVlYjE4MGI4ZThhMDI3YmQyZDVhNyIsInVzZXJUeXBlIjoiVmVuZG9yIiwiaWF0IjoxNzQzNjM0MjMxLCJleHAiOjE3NDU0NDg2MzF9.Br53_alrT8S6jN45oqANdV2RtYWhVIH3AJ39QsSV4RM");
  }
  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().userProfile(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTVlYjE4MGI4ZThhMDI3YmQyZDVhNyIsInVzZXJUeXBlIjoiVmVuZG9yIiwiaWF0IjoxNzQzNjM0MjMxLCJleHAiOjE3NDU0NDg2MzF9.Br53_alrT8S6jN45oqANdV2RtYWhVIH3AJ39QsSV4RM");

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

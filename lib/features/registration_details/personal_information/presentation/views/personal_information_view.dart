import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/views/health_info_one.dart';
import 'package:fitfat/features/registration_details/personal_information/data/personal_info_cubit/personal_info_cubit.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/current_page_indicator_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/personal_information_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import '../../data/personal_info_cubit/personal_info_state.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.secondColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const PersonalInformationUpperText(),
          BlocListener<PersonalInfoCubit, PersonalInfoState>(
            listener: (context, state) {
              if (state is PersonalInfoSuccess) {
                showSnackBar(context, "sucess");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HealthInfoOne(),
                  ),
                );
              } else if (state is PersonalInfoFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMessage)),
                );
              }
            },
            child: PersonalInformationSection(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HealthInfoOne(),
                    ));
                final cubit = context.read<PersonalInfoCubit>();
                cubit.postPersonalInfo(
                    token: context.read<LoginCubit>().user!.token);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalInformationUpperText extends StatelessWidget {
  const PersonalInformationUpperText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile Setup",
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppLightColor.mainColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const CurrentPageIndicatorSection(
            nextPageTitle: "Next: Health Information",
            currentPageTitle: "Personal Information",
            value: 1,
            step: 1,
          ),
        ],
      ),
    );
  }
}

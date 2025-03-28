import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/main/presentaion/widgets/info_text.dart';
import 'package:fitfat/features/profile/presentation/views/update_profile_view.dart';
import 'package:fitfat/features/profile/presentation/widgets/diet_user_data.dart';
import 'package:fitfat/features/profile/presentation/widgets/health_user_data.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: AppLightColor.whiteColor,
        //elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile Information',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppLightColor.mainColor),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute( builder: (context) => const UpdateProfile(),),);
                      },
                      child: SvgPicture.asset(Assets.icons.edit))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'General Information',
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppLightColor.blackColor),
              ),
              const SizedBox(
                height: 15,
              ),
              HealthUserData(),
              const SizedBox(
                height: 5,
              ),
              DietUserData(),
              const SizedBox(
                height: 5,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

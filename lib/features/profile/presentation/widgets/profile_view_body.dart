import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_profile_card.dart';
import 'package:fitfat/features/profile/presentation/widgets/diet_user_data.dart';
import 'package:fitfat/features/profile/presentation/widgets/personal_user_data.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool isSwitched = false;

  @override


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PersonalUserData(),
          const CustomProfileCard(),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              color: AppLightColor.whiteColor,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General Settings',
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppLightColor.mainColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.language),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Languages',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppLightColor.blackColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.darkMode),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Dark Mode',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppLightColor.blackColor),
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeColor: Colors.white,
                          activeTrackColor: Colors.red,
                          // Color when switched on
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor:
                          Colors.grey[300], // Default off color
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.contactSupport),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Contact Support',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppLightColor.blackColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.accountSettings),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Account Settings',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppLightColor.blackColor),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,)
        ],
      )
    );
  }
}

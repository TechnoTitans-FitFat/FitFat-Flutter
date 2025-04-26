import 'package:fitfat/core/constants/light_colors.dart';

import 'package:fitfat/features/main/presentaion/widgets/custom_profile_card.dart';
import 'package:fitfat/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:fitfat/features/profile/presentation/widgets/personal_user_data.dart';
import 'package:fitfat/gen/assets.gen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../settings/presentation/views/account_settings_view.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              PersonalUserData(),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'General Settings',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppLightColor.mainColor),
                        ),
                        CustomListTile(
                          image: Assets.icons.language,
                          title: 'Languages',
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            SvgPicture.asset(Assets.icons.darkMode),
                            Text(
                              'Dark Mode',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppLightColor.blackColor),
                            ),
                            const Spacer(),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeColor: Colors.white,
                              activeTrackColor: Colors.red,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey[300],
                            ),
                          ],
                        ),
                        CustomListTile(
                          image: Assets.icons.contactSupport,
                          title: 'Contact Support',
                        ),
                        CustomListTile(
                          image: Assets.icons.accountSettings,
                          title: 'Account Settings',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AccountSettingsView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ]),
    );
  }
}

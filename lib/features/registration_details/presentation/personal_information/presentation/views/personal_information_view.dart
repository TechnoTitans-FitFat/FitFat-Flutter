import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/personal_information_upper_text.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/personal_information_section.dart';
import 'package:flutter/material.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({
    super.key,
    required this.userId,
  });
  final String userId;
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
          PersonalInformationSection(userId: userId),
        ],
      ),
    );
  }
}

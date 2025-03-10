import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/gender_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/date_of_birth_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';

import 'package:flutter/material.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomContainerProfileSetUp(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          const DateOfBirthSection(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextButton(
                  onPressed: onPressed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

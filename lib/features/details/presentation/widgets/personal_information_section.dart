import 'package:fitfat/features/details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/details/presentation/widgets/date_of_birth_section.dart';
import 'package:fitfat/features/details/presentation/widgets/gender_section.dart';
import 'package:fitfat/features/details/presentation/widgets/next_button.dart';
import 'package:fitfat/features/details/presentation/widgets/weight_and_height_section.dart';
import 'package:flutter/material.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomContainerProfileSetUp(
      child: Column(
        children: [
          SizedBox(height: 30),
          GenderSection(),
          DateOfBirthSection(),
          WeightAndHeightSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

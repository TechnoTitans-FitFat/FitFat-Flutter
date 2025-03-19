import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/profile/presentation/widgets/gender_selection.dart';
import 'package:fitfat/features/profile/presentation/widgets/num_fields.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/date_of_birth_section.dart';
import 'package:flutter/material.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({super.key});

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  String dateOfBirth = '';

  String gender = 'Female';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppLightColor.whiteColor),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "General Information",
                style: TextStyle(
                    fontSize: AppStyles.textStyle18.fontSize,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Divider(color: AppLightColor.greyColor, height: 8),
            ),
            GenderSelection(
              onGenderSelected: (p0) {},
            ),
            DateOfBirthSection(
              onDateChanged: (String dob) {
                setState(() {
                  dateOfBirth = dob;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Height",
                          style: TextStyle(
                              fontWeight: AppStyles.textStyle18.fontWeight,
                              fontSize: AppStyles.textStyle18.fontSize),
                        ),
                      ),
                      TextFieldProfile(
                        hint: "Height",
                        lable: "Height",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Weight",
                          style: TextStyle(
                              fontWeight: AppStyles.textStyle18.fontWeight,
                              fontSize: AppStyles.textStyle18.fontSize),
                        ),
                      ),
                      TextFieldProfile(
                        lable: "Weight",
                        hint: "Weight",
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

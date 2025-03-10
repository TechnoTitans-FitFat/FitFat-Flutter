import 'package:fitfat/features/registration_details/presentation/health_information/presentation/views/health_info_one.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/date_of_birth_section.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/gender_section.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/weight_and_height_section.dart';
import 'package:flutter/material.dart';
import '../../../widgets/next_button.dart';

class PersonalInformationSection extends StatefulWidget {
  const PersonalInformationSection({super.key});

  @override
  _PersonalInformationSectionState createState() =>
      _PersonalInformationSectionState();
}

class _PersonalInformationSectionState
    extends State<PersonalInformationSection> {
  String selectedGender = '';
  String dateOfBirth = '';
  String weight = '';
  String height = '';

  @override
  Widget build(BuildContext context) {
    return CustomContainerProfileSetUp(
      child: Column(
        children: [
          const SizedBox(height: 30),
          GenderSection(
            onSelectGender: (String gender) {
              setState(() {
                selectedGender = gender;
              });
            },
          ),
          DateOfBirthSection(
            onDateChanged: (String dob) {
              setState(() {
                dateOfBirth = dob;
              });
            },
          ),
          WeightAndHeightSection(
            onWeightHeightChanged: (String newWeight, String newHeight) {
              setState(() {
                weight = newWeight;
                height = newHeight;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HealthInfoOne(
                            selectedGender: selectedGender,
                            dateOfBirth: dateOfBirth,
                            height: height,
                            weight: weight,
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

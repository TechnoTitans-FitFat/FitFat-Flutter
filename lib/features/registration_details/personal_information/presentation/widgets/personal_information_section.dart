import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/personal_information/presentation/widgets/date_of_birth_section.dart';
import 'package:fitfat/features/registration_details/personal_information/presentation/widgets/gender_section.dart';
import 'package:fitfat/features/registration_details/personal_information/presentation/widgets/weight_and_height_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import '../../../presentation/widgets/next_button.dart';
import '../../data/personal_info_cubit/personal_info_cubit.dart';

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
    return BlocProvider(
      create: (context) => PersonalInfoCubit(context.read<ApiConsumer>()),
      child: CustomContainerProfileSetUp(
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
                      print('Gender: $selectedGender');
                      print('Date of Birth: $dateOfBirth');
                      print('Weight: $weight');
                      print('Height: $height');
                      final personalInfoCubit =
                          context.read<PersonalInfoCubit>();
                      personalInfoCubit.postPersonalInfo(
                        token: context
                            .read<LoginCubit>()
                            .user!
                            .token, // Replace with your actual token
                        weight: int.parse(weight),
                        height: int.parse(height),
                        dateOfBirth: dateOfBirth,
                        gender: selectedGender,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

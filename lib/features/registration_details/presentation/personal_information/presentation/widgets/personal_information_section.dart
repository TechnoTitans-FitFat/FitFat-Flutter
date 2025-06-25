import 'package:fitfat/features/registration_details/presentation/health_information/presentation/views/health_info_one.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/date_of_birth_section.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/gender_section.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/widgets/weight_and_height_section.dart';
import 'package:flutter/material.dart';
import '../../../widgets/next_button.dart';

class PersonalInformationSection extends StatefulWidget {
  const PersonalInformationSection({
    super.key,
    required this.userId,
  });
  final String userId;
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
  String? genderError;
  String? dobError;
  String? weightError;
  String? heightError;

  bool validateInputs() {
    bool isValid = true;
    if (selectedGender.isEmpty) {
      setState(() {
        genderError = 'Please select a gender';
      });
      isValid = false;
    } else {
      setState(() {
        genderError = null;
      });
    }
    if (dateOfBirth.isEmpty) {
      setState(() {
        dobError = 'Please select a valid date of birth';
      });
      isValid = false;
    } else {
      try {
        final parts = dateOfBirth.split('/');
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);
        final now = DateTime.now();
        final dob = DateTime(year, month, day);
        final age = now.year -
            dob.year -
            (now.month < dob.month ||
                    (now.month == dob.month && now.day < dob.day)
                ? 1
                : 0);
        if (age < 13 || age > 120 || dob.isAfter(now)) {
          setState(() {
            dobError = 'Please enter a valid date of birth (age 13-120)';
          });
          isValid = false;
        } else {
          setState(() {
            dobError = null;
          });
        }
      } catch (e) {
        setState(() {
          dobError = 'Invalid date format';
        });
        isValid = false;
      }
    }

    if (weight.isEmpty) {
      setState(() {
        weightError = 'Please enter weight';
      });
      isValid = false;
    } else {
      try {
        final w = double.parse(weight);
        if (w < 30 || w > 300) {
          setState(() {
            weightError = 'Weight must be between 30 and 300 kg';
          });
          isValid = false;
        } else {
          setState(() {
            weightError = null;
          });
        }
      } catch (e) {
        setState(() {
          weightError = 'Invalid weight format';
        });
        isValid = false;
      }
    }

    // Validate Height
    if (height.isEmpty) {
      setState(() {
        heightError = 'Please enter height';
      });
      isValid = false;
    } else {
      try {
        final h = double.parse(height);
        if (h < 100 || h > 250) {
          setState(() {
            heightError = 'Height must be between 100 and 250 cm';
          });
          isValid = false;
        } else {
          setState(() {
            heightError = null;
          });
        }
      } catch (e) {
        isValid = false;
      }
    }

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainerProfileSetUp(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            GenderSection(
              onSelectGender: (String gender) {
                setState(() {
                  selectedGender = gender;
                  genderError = null;
                });
              },
              errorText: genderError,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DateOfBirthSection(
                onDateChanged: (String dob) {
                  setState(() {
                    dateOfBirth = dob;
                    dobError = null;
                  });
                },
                errorText: dobError,
              ),
            ),
            WeightAndHeightSection(
              onWeightHeightChanged: (String newWeight, String newHeight) {
                setState(() {
                  weight = newWeight;
                  height = newHeight;
                  weightError = null;
                  heightError = null;
                });
              },
              weightError: weightError,
              heightError: heightError,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NextButton(
                    onPressed: () {
                      if (validateInputs()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HealthInfoOne(
                              userId: widget.userId,
                              selectedGender: selectedGender,
                              dateOfBirth: dateOfBirth,
                              height: height,
                              weight: weight,
                            ),
                          ),
                        );
                      }
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

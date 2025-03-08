import 'package:fitfat/features/registration_details/health_information/presentation/widgets/health_information_upper_text_two.dart';
import 'package:fitfat/features/registration_details/diet_information/presentation/views/diet_information_view.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/widgets/diabets_information.dart';
import 'package:flutter/material.dart';

class HealthInfoTwoBody extends StatefulWidget {
  const HealthInfoTwoBody({super.key});

  @override
  State<HealthInfoTwoBody> createState() => _HealthInfoTwoBodyState();
}

class _HealthInfoTwoBodyState extends State<HealthInfoTwoBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const HealthInformationUpperTextTwo(),
        const SizedBox(
          height: 30,
        ),
        CustomContainerProfileSetUp(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: DiabetsInformation(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DietInformationView(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

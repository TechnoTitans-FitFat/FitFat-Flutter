import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/widgets/health_info_two_body.dart';
import 'package:flutter/material.dart';

class HealthInfoTwo extends StatelessWidget {
  const HealthInfoTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppLightColor.secondColor,
      body: HealthInfoTwoBody(),
    );
  }
}

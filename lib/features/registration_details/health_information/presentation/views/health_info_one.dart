import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/views/health_info_two.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/widgets/health_info_one_body.dart';
import 'package:flutter/material.dart';

class HealthInfoOne extends StatelessWidget {
  const HealthInfoOne({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.secondColor,
      body: HealthInfoOneBody(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HealthInfoTwo(),
              ));
        },
      ),
    );
  }
}

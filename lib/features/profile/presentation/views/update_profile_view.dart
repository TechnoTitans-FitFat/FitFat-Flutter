import 'package:fitfat/features/profile/presentation/widgets/custom_appbar.dart';
import 'package:fitfat/features/profile/presentation/widgets/first_container.dart';
import 'package:fitfat/features/profile/presentation/widgets/second_container.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFBE0E2),
      appBar: CustomAppbarProfile(),
      body: Padding(padding: EdgeInsets.only(top: 18,left: 18,right: 18), child: SingleChildScrollView(
        child: Column(
          children: [
            FirstContainer(),
            SizedBox(height: 30,),
            SecondContainer(),
          ],
        ),
      )),
    );
  }
}
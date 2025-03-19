import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class TextFieldProfile extends StatelessWidget {
  TextFieldProfile({super.key,this.controller,this.hint,this.lable});

  String? lable;
  String? hint;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint!,
        labelText: lable!,
        border:const  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),borderSide: BorderSide(color: AppLightColor.greyColor),),
      ),
    );
  }
}

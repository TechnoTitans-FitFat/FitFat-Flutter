import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CustomTextField({this.hint, this.icon, this.onchange});

  IconData? icon;
  String? hint;
  Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
        onChanged: onchange,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hint,
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8));
  }
}

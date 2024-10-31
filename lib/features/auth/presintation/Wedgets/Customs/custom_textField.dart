import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key, this.hint, this.icon, this.onchange, this.sufIcon, this.sufIconNot});

  IconData? icon;
  IconData? sufIcon;
  IconData? sufIconNot;
  String? hint;
  Function(String)? onchange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

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
        },
        onChanged: widget.onchange,
        obscureText: passwordVisible,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.grey),
          suffixIcon: IconButton(
              onPressed: () {
                setState(
                      () {
                    passwordVisible = !passwordVisible;
                  },
                );
              },
              icon: Icon(passwordVisible ? widget.sufIcon : widget.sufIconNot,color: Colors.grey,)),
          hintText: widget.hint,
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
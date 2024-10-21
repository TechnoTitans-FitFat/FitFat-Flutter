import 'package:flutter/material.dart';
class CustomBottom extends StatelessWidget {
  CustomBottom({this.ontap, this.text});

  VoidCallback? ontap;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(text!, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

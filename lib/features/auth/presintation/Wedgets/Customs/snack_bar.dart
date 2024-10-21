import 'package:flutter/material.dart';


void ShowSnackBar(BuildContext context, massage) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(massage)));
}

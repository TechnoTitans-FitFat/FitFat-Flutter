import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
}

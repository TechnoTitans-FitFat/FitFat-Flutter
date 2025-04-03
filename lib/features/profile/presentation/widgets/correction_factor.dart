import 'package:flutter/material.dart';

class CorrectionFactor extends StatefulWidget {
  final Function(String) onFactorChanged;

  CorrectionFactor({super.key, required this.onFactorChanged, required this.controller});
  final TextEditingController controller;
  @override
  State<CorrectionFactor> createState() => _InsulinToCarbRatioInputState();
}

class _InsulinToCarbRatioInputState extends State<CorrectionFactor> {


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        Row(
          children: [
            const Text(
              "1Unit lowers Blood Suger By:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 50,
              child: TextField(
                controller: widget.controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    isDense: true,
                    hintText:"50"
                ),
                onChanged: (value) {
                  widget.onFactorChanged(value);
                },
              ),
            ),
            const Text(
              " mg/dL",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}

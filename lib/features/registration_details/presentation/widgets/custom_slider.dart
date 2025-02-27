
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider(
      {super.key,
      required this.label,
      required this.value,
      required this.min,
      required this.max,
      required this.onChanged});
  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double currentSliderValue = 50;

  _CustomSliderState();
  @override
  void initState() {
    super.initState();
    currentSliderValue = widget.value; // Initialize with the passed value
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.label} : ${currentSliderValue.toInt()}",
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppLightColor.blackColor,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: double.infinity),
          child: Slider(
            value: currentSliderValue,
            min: widget.min,
            max: widget.max,
            divisions: (widget.max - widget.min).toInt(),
            activeColor: AppLightColor.mainColor,
            inactiveColor: Colors.grey,
            label: currentSliderValue.toInt().toString(),
            onChanged: (value) {
              setState(() {
                currentSliderValue = value;
              });
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}

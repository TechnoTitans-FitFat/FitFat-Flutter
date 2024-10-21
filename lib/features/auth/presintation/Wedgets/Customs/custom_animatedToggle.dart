import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class AnimatedToggle extends StatefulWidget {
  const AnimatedToggle({
    super.key,
  });

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  @override
  bool isSelected = false;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: AnimatedToggleSwitch<bool>.size(
        current: isSelected,
        values: [true, false],
        //iconOpacity: 0.2,
        indicatorSize: Size.fromWidth(200),
        customIconBuilder: (context, local, global) => Text(
          local.value ? 'Login' : 'Sign Up',
          style: TextStyle(
            color: Color.lerp(Colors.red, Colors.white, local.animationValue),
          ),
        ),
        borderWidth: 0.5,
        iconAnimationType: AnimationType.onHover,
        style: ToggleStyle(
          indicatorColor: Colors.red,
          borderColor: Colors.grey,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        selectedIconScale: 1.0,
        onChanged: (value) {
          setState(() {
            isSelected = value;
          });
        },
      ),
    );
  }
}

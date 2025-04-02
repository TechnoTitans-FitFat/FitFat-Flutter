// import 'package:flutter/material.dart';
//
// class InsulinToCarbRatioInput extends StatefulWidget {
//   final Function(String) onFactorChanged;
//
//   InsulinToCarbRatioInput({super.key, required this.onFactorChanged, required this.controller});
//   final TextEditingController controller;
//   @override
//   State<InsulinToCarbRatioInput> createState() => _InsulinToCarbRatioInputState();
// }
//
// class _InsulinToCarbRatioInputState extends State<InsulinToCarbRatioInput> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const SizedBox(width: 10),
//         Row(
//           children: [
//             const Text(
//               "1:",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(width: 5),
//             SizedBox(
//               width: 50,
//               child: TextField(
//                 controller: widget.controller,
//                 keyboardType: TextInputType.number,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(vertical: 10),
//                     isDense: true,
//                     hintText:" 35"
//                 ),
//                 onChanged: (value) {
//                   widget.onFactorChanged(value);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

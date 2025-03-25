// import 'dart:io';
//
// import 'package:fitfat/features/profile/presentation/data/profile_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class ImageUpload extends StatelessWidget {
//   const ImageUpload({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         ImagePicker()
//             .pickImage(source: ImageSource.gallery)
//             .then((value) => context.read<UserCubit>().uploadProfilePic(value!));
//       },
//       child: BlocConsumer<UserCubit,UserState>(
//         listener: (BuildContext context, state) {},
//         builder: (BuildContext context, state) {
//           return context
//               .read<UserCubit>()
//               .profilePic == null
//               ? const CircleAvatar(
//             radius: 50,
//             backgroundImage: AssetImage('assets/images/male.png'),
//           ): CircleAvatar(
//             radius: 50,
//             backgroundImage: FileImage(
//                 File(context.read<UserCubit>().profilePic!.path)),
//           );
//         },
//       ),
//     );
//   }
// }

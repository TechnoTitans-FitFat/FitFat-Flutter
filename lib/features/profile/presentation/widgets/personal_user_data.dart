// import 'package:fitfat/core/helper/show_snack_bar.dart';
// import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
// import 'package:fitfat/features/profile/presentation/data/profile_cubit.dart';
// import 'package:fitfat/features/profile/presentation/widgets/image_upload.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class PersonalUserData extends StatelessWidget {
//   const PersonalUserData({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<UserCubit,UserState>(
//         listener: ( context, state) {
//       if(state is UserError){
//         showSnackBar(context, state.message);
//       }
//     },
//     builder: ( context, state) {
//     return Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(top: 50),
//           child: Center(
//             child: ImageUpload(),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Text(
//           context.read<LoginCubit>().user!.name,
//           style: GoogleFonts.roboto(
//               fontSize: 18, fontWeight: FontWeight.w400),
//         ),
//         Text(
//       context.read<LoginCubit>().user!.email,
//           style: GoogleFonts.roboto(
//               fontSize: 18, fontWeight: FontWeight.w400),
//         )
//       ],
//     );
//   }
//     );
//   }
// }

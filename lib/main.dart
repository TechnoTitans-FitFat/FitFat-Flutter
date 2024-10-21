import 'package:firebase_core/firebase_core.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/auth_bloc.dart';
import 'package:fitfat/features/auth/presintation/views/login_and_register_view.dart';
import 'package:fitfat/features/auth/presintation/views/sign_up_view.dart';
import 'package:fitfat/features/splash/presentaion/views/splash.dart';
import 'package:fitfat/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}

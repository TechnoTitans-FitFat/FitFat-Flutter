import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/main/data/main_screen_cubit/main_screen_cubit.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_cubit.dart';
import 'package:fitfat/features/meal_details/presentation/views/details_view.dart';
import 'package:fitfat/features/registration_details/personal_information/presentation/views/personal_information_view.dart';
import 'package:fitfat/features/suggestions/data/suggestions_cubit/suggestions_cubit.dart';
import 'package:fitfat/features/registration_details/personal_information/data/personal_info_cubit/personal_info_cubit.dart';
import 'package:fitfat/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/cache/cache_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PersonalInfoCubit(DioComsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => LoginCubit(DioComsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(DioComsumer(dio: Dio())),
        ),
        BlocProvider(
            create: (context) => MainScreenCubit(DioComsumer(dio: Dio()))
              ..fetchMainScreenData()),
        BlocProvider(
            create: (context) => MealDetailsCubit(DioComsumer(dio: Dio()))),
              BlocProvider( 
          create: (context) => SuggestionsCubit(DioComsumer(dio: Dio()))..fetchSuggestionsData()
        ),
      ],
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}

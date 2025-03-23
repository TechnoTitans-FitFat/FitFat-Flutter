import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/otp_screen.dart';
import 'package:fitfat/features/main/data/main_screen_cubit/main_screen_cubit.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_cubit.dart';
import 'package:fitfat/features/settings/data/settings_cubit/account_settings_cubit.dart';
import 'package:fitfat/features/suggestions/data/suggestions_cubit/suggestions_cubit.dart'
    show SuggestionsCubit;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'core/cache/cache_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
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
            create: (context) => AccountSettingsCubit(DioComsumer(dio: Dio()))),
        BlocProvider(
            create: (context) => HealthInfoCubit(DioComsumer(dio: Dio()))),
        BlocProvider(
            create: (context) => DietInfoCubit(DioComsumer(dio: Dio()))),
        BlocProvider(create: (context) => LoginCubit(DioComsumer(dio: Dio()))),
        BlocProvider(
            create: (context) => RegisterCubit(DioComsumer(dio: Dio()))),
        BlocProvider(
            create: (context) => MainScreenCubit(DioComsumer(dio: Dio()))
              ..fetchMainScreenData()),
        BlocProvider(
            create: (context) => MealDetailsCubit(DioComsumer(dio: Dio()))),
        BlocProvider(
            create: (context) => SuggestionsCubit(DioComsumer(dio: Dio()))
              ..fetchSuggestionsData()),
        BlocProvider(
          create: (context) => FavouritesCubit(DioComsumer(dio: Dio())),
        ),
      ],
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        //home: LoginSignUp(DioComsumer(dio: Dio())),

        initialRoute: '/', // Define initial route
        getPages: [
          GetPage(name: '/', page: () => const LoginSignUp(DioComsumer)),
          GetPage(
            name: '/otpScreen',
            page: () {
              return OtpScreen();
            },
          ),
          // Add OTP Screen route
        ],
      ),
    );
  }
}

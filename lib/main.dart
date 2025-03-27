import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/auth/presentation/widgets/otp_screen.dart';
import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';
import 'package:fitfat/features/main/data/main_screen_cubit/main_screen_cubit.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/data/diabets_cubit/diabets_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/diet_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/high_carb_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/keto_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/low_carb_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/vegan_cubit.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_cubit.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/views/personal_information_view.dart';
import 'package:fitfat/features/settings/data/settings_cubit/account_settings_cubit.dart';
import 'package:fitfat/features/suggestions/data/suggestions_cubit/suggestions_cubit.dart'
    show SuggestionsCubit;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'core/cache/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
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
        BlocProvider(
            create: (context) =>
                DietCubit(DioComsumer(dio: Dio()))..fetchDietData()),
        BlocProvider(
            create: (context) =>
                KetoCubit(DioComsumer(dio: Dio()))..fetchKetoData()),
        BlocProvider(
            create: (context) =>
                VeganCubit(DioComsumer(dio: Dio()))..fetchVeganData()),
        BlocProvider(
            create: (context) =>
                HighCarbCubit(DioComsumer(dio: Dio()))..fetchHighCarbData()),
        BlocProvider(
            create: (context) =>
                LowCarbCubit(DioComsumer(dio: Dio()))..fetchLowCarbData()),
        BlocProvider(
            create: (context) =>
                DiabetsCubit(DioComsumer(dio: Dio()))..fetchDiabetsData()),
        BlocProvider(
            create: (context) =>
                MenuCubit(DioComsumer(dio: Dio()))..fetchMenuData()),
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

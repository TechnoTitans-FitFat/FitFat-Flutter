import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/core/cubit/theme/theme_cubit.dart';
import 'package:fitfat/core/cubit/theme/theme_state.dart';
import 'package:fitfat/core/extensions/theme_cubit_extension.dart';
import 'package:fitfat/core/theme/dark_theme.dart';
import 'package:fitfat/core/theme/light_theme.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/auth/presentation/widgets/otp_screen.dart';
import 'package:fitfat/features/cart/cubit/clear_cart_cubit.dart';
import 'package:fitfat/features/cart/cubit/delete_cart_cubit.dart';
import 'package:fitfat/features/cart/cubit/get_cart_cubit.dart';
import 'package:fitfat/features/chat/data/chat_bot_cubit/chat_bot_cubit.dart';
import 'package:fitfat/features/favourites/data/favourites_cubit/favourites_cubit.dart';
import 'package:fitfat/features/forget_password/data/forget_password_remote_datasource.dart';
import 'package:fitfat/features/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:fitfat/features/forget_password/domain/usecases/reset_password_usecase.dart';
import 'package:fitfat/features/forget_password/domain/usecases/send_otp_usecase.dart';
import 'package:fitfat/features/forget_password/domain/usecases/verify_otp_usecase.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:fitfat/features/main/data/main_screen_cubit/main_screen_cubit.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/allregy_cubit.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/lactose_cubit.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/peanuts_cubit.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/shellfish_cubit.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/wheat_cubit.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/data/diabets_cubit/diabets_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/diet_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/high_carb_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/keto_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/low_carb_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/vegan_cubit.dart';
import 'package:fitfat/features/meal_details/data/card_cubit/decrement_cubit.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_cubit.dart';
import 'package:fitfat/features/menu/chicken/data/chicken_cubit/chicken_cubit.dart';
import 'package:fitfat/features/menu/data/cart_cubit/cart_cubit.dart';
import 'package:fitfat/features/menu/sandwich/data/sandwich_cubit/sandwich_cubit.dart';
import 'package:fitfat/features/menu/soup/data/soup_cubit/soup_cubit.dart';
import 'package:fitfat/features/offers/data/offer_cubit/offer_cubit.dart';
import 'package:fitfat/features/menu/data/menu_cubit/menu_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/diet_info_cubit/update_diet_info_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/health_info_cubit/update_health_info_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_cubit.dart';
import 'package:fitfat/features/search/data/search_cubit/search_cubit.dart';
import 'package:fitfat/features/search/data/search_history/search_history_cubit.dart';
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
  return runApp(
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
    ApiServices apiServices = ApiServices(Dio());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClearCartCubit(apiServices)),
        BlocProvider(create: (context) => DeleteCubit(apiServices)),
        BlocProvider(create: (context) => UpdateDietInfoCubit()),
        BlocProvider(
          create: (context) => UpdateHealthInfoCubit(),
        ),
        BlocProvider(create: (context) => DecrementCubit(apiServices)),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(
            sendOtpUseCase: SendOtpUseCase(
              ForgotPasswordRepository(
                ForgotPasswordRemoteDatasource(),
              ),
            ),
            verifyOtpUseCase: VerifyOtpUseCase(
              ForgotPasswordRepository(
                ForgotPasswordRemoteDatasource(),
              ),
            ),
            resetPasswordUseCase: ResetPasswordUseCase(
              ForgotPasswordRepository(
                ForgotPasswordRemoteDatasource(),
              ),
            ),
          ),
        ),
        BlocProvider(create: (context) => GetCartCubit(apiServices)),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => UserProfileCubit()),
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
              ..fetchSuggestionsData(context)),
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
                AllregyCubit(DioComsumer(dio: Dio()))..fetchAllergyData()),
        BlocProvider(
            create: (context) =>
                LactoseCubit(DioComsumer(dio: Dio()))..fetchLactoseData()),
        BlocProvider(
            create: (context) =>
                WheatCubit(DioComsumer(dio: Dio()))..fetchWheatData()),
        BlocProvider(
            create: (context) =>
                ShellfishCubit(DioComsumer(dio: Dio()))..fetchShellfishData()),
        BlocProvider(
            create: (context) =>
                PeanutsCubit(DioComsumer(dio: Dio()))..fetchPeanutsData()),
        BlocProvider(
            create: (context) =>
                DiabetsCubit(DioComsumer(dio: Dio()))..fetchDiabetsData()),
        BlocProvider(
            create: (context) =>
                MenuCubit(DioComsumer(dio: Dio()))..fetchMenuData()),
        BlocProvider(
            create: (context) =>
                CartCubit(apiServices)..addCartAndIncrement(context: context)),
        BlocProvider(
            create: (context) => ChatBotCubit(DioComsumer(dio: Dio()))),
        BlocProvider(
          create: (context) => SearchCubit(DioComsumer(dio: Dio())),
        ),
        BlocProvider(
            create: (context) => SearchHistoryCubit(DioComsumer(dio: Dio()))
              ..getLatestSearches(context)),
        BlocProvider(
            create: (context) =>
                OfferCubit(DioComsumer(dio: Dio()))..fetchOffersData()),
        BlocProvider(
            create: (context) =>
                ChickenCubit(DioComsumer(dio: Dio()))..fetchChickenRecipes()),
        BlocProvider(
            create: (context) => SandwichCubit(DioComsumer(dio: Dio()))
              ..fetchSandwichsRecipes()),
        BlocProvider(
            create: (context) =>
                SoupCubit(DioComsumer(dio: Dio()))..fetchSoupRecipes()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return GetMaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: context.themeCubit.themeMode,
            home: LoginSignUp(DioComsumer(dio: Dio())),
            getPages: [
              GetPage(name: '/', page: () => const LoginSignUp(DioComsumer)),
              GetPage(
                name: '/otpScreen',
                page: () {
                  return const OtpScreen();
                },
              ),
              // Add OTP Screen route
            ]
            // Define initial route
            ,
          );
        },
      ),
    );
  }
}

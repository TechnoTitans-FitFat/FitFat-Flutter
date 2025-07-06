import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    debugPrint("SplashBody: initState started");

    initSlidingAnimation();

    // Initialize SharedPreferences and check login status
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      debugPrint("SplashBody: Starting login status check");
      try {
        debugPrint("SplashBody: Preloading SharedPreferences");
        await SharedPreferences
            .getInstance(); // Preload to ensure initialization
        debugPrint("SplashBody: SharedPreferences preloaded");
        await Future.delayed(
            const Duration(seconds: 1)); // Reduced for faster testing
        debugPrint("SplashBody: Delay completed, checking login status");
        await checkLoginStatus();
      } catch (e, stackTrace) {
        debugPrint("SplashBody: initState error=$e");
        debugPrint("SplashBody: initState stackTrace=$stackTrace");
        Get.off(() => const LoginSignUp(DioComsumer),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 250));
      }
    });

    // Fade in logo
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
          debugPrint("SplashBody: Logo opacity set to 1.0");
        });
      }
    });
  }

  @override
  void dispose() {
    debugPrint("SplashBody: Disposing animationController");
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("SplashBody: Building UI");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context, _) {
                return SlideTransition(
                    position: slidingAnimation,
                    child: const Text(
                      'Welcome to',
                      style: TextStyle(
                        color: AppLightColor.mainColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ));
              }),
          const SizedBox(height: 30),
          AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: SvgPicture.asset(
                'assets/images/FITFAT LOGO 1.svg',
                height: 175,
                width: 175,
              )),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    debugPrint("SplashBody: Initializing animation");
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    debugPrint("SplashBody: Animation started");
  }

  Future<void> checkLoginStatus() async {
    debugPrint("checkLoginStatus: Starting");
    try {
      debugPrint("checkLoginStatus: Accessing SharedPreferences");
      final prefs = await SharedPreferences.getInstance();
      debugPrint("checkLoginStatus: SharedPreferences accessed");

      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      debugPrint("checkLoginStatus: isLoggedIn=$isLoggedIn");

      final token = prefs.getString('token');
      debugPrint("checkLoginStatus: token=$token");

      if (isLoggedIn && token != null && token.isNotEmpty) {
        debugPrint(
            "checkLoginStatus: Valid login data found, navigating to MainScreen");
        Get.off(() => const MainScreen(),
            transition: Transition.circularReveal,
            duration: const Duration(milliseconds: 250));
      } else {
        debugPrint(
            "checkLoginStatus: No valid login data, navigating to LoginSignUp");
        Get.off(() => const LoginSignUp(DioComsumer),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 250));
      }
    } catch (e, stackTrace) {
      debugPrint("checkLoginStatus: Error=$e");
      debugPrint("checkLoginStatus: StackTrace=$stackTrace");
      Get.off(() => const LoginSignUp(DioComsumer),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 250));
    }
  }
}

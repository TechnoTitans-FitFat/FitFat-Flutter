import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/auth_utils.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
        // Show splash animation first
        await Future.delayed(const Duration(seconds: 2));
        debugPrint("SplashBody: Animation completed, checking login status");
        await checkLoginStatus();
      } catch (e, stackTrace) {
        debugPrint("SplashBody: initState error=$e");
        debugPrint("SplashBody: initState stackTrace=$stackTrace");
        _navigateToLogin();
      }
    });

    // Fade in logo
    Future.delayed(const Duration(milliseconds: 500), () {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
      debugPrint("checkLoginStatus: Checking authentication status");

      final isAuthenticated = await AuthUtils.isAuthenticated();

      if (isAuthenticated) {
        debugPrint(
            "checkLoginStatus: User is authenticated, navigating to MainScreen");
        _navigateToMain();
      } else {
        debugPrint(
            "checkLoginStatus: User is not authenticated, navigating to LoginSignUp");
        _navigateToLogin();
      }
    } catch (e, stackTrace) {
      debugPrint("checkLoginStatus: Error=$e");
      debugPrint("checkLoginStatus: StackTrace=$stackTrace");
      _navigateToLogin();
    }
  }

  void _navigateToMain() {
    if (mounted) {
      Get.offAll(() => const MainScreen(),
          transition: Transition.circularReveal,
          duration: const Duration(milliseconds: 500));
    }
  }

  void _navigateToLogin() {
    if (mounted) {
      Get.offAll(() => const LoginSignUp(DioComsumer),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 500));
    }
  }
}

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presintation/views/login_and_register_view.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:flutter/material.dart';
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

    initSlidingAnimation();

    checkLoginStatus();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        color:AppLightColor.mainColor,
                        fontSize: 30,
                       // fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ));
              }),
          const SizedBox(height: 30),
          AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'imges/logo.png',
                height: 175,
                width: 175,
              )),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Future.delayed(const Duration(seconds: 2), () {
      if (isLoggedIn) {
        // Navigate to NextPage if logged in
        Get.to(() => const MainScreen(),
            transition: Transition.circularReveal,
            duration: const Duration(milliseconds: 250));
      } else {
        // Navigate to Login Screen if not logged in
        Get.to(() => const LoginSignUp(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 250));
      }
    });
  }
}

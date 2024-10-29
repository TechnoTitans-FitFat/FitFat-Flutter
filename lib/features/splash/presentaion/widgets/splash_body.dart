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

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    checkLoginStatus();
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
                    child: Image.asset(
                      'imges/logo.png',
                      height: 175,
                      width: 175,
                    ));
              }),
          const SizedBox(
            height: 7,
          ),
          // Text('Welcome to our app',style: TextStyle(color:Colors.red),)
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
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

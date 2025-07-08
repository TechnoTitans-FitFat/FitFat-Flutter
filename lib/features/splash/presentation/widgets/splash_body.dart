import 'package:dio/dio.dart';
import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart'; // Import your MainScreen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
    initOpacityAnimation();
    navigateBasedOnLoginState();
  }

  @override
  void dispose() {
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
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: SvgPicture.asset(
                'assets/images/FITFAT LOGO 1.svg',
                height: 175,
                width: 175,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    debugPrint("SplashBody: Initializing sliding animation");
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(-2, 0),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    debugPrint("SplashBody: Sliding animation started");
  }

  void initOpacityAnimation() {
    debugPrint("SplashBody: Initializing opacity animation");
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });
  }

  void navigateBasedOnLoginState() {
    debugPrint("SplashBody: Checking login state");
    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        debugPrint("SplashBody: Animation completed, checking login status");
        final loginCubit = context.read<LoginCubit>();
        bool isLoggedIn = await loginCubit.isLoggedIn();

        if (mounted) {
          if (isLoggedIn) {
            debugPrint(
                "SplashBody: User is logged in, navigating to MainScreen");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          } else {
            debugPrint(
                "SplashBody: User is not logged in, navigating to LoginScreen");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginSignUp(DioComsumer(dio: Dio()))),
            );
          }
        }
      }
    });
  }
}

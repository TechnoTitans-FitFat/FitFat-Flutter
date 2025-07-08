import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitfat/core/utils/auth_utils.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/core/api/dio_comsumer.dart';

class AuthWrapper extends StatefulWidget {
  final Widget child;
  final Widget? loadingWidget;
  final Widget? unauthenticatedWidget;

  const AuthWrapper({
    Key? key,
    required this.child,
    this.loadingWidget,
    this.unauthenticatedWidget,
  }) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isLoading = true;
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    try {
      final isAuthenticated = await AuthUtils.isAuthenticated();

      if (mounted) {
        setState(() {
          _isAuthenticated = isAuthenticated;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isAuthenticated = false;
          _isLoading = false;
        });
      }
    }
  }

  void _redirectToLogin() {
    Get.offAll(() => const LoginSignUp(DioComsumer),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return widget.loadingWidget ??
          const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
    }

    if (!_isAuthenticated) {
      if (widget.unauthenticatedWidget != null) {
        return widget.unauthenticatedWidget!;
      }

      // Redirect to login after a short delay to avoid immediate navigation
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _redirectToLogin();
      });

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return widget.child;
  }
}

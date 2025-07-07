import 'package:flutter/material.dart';
import 'package:fitfat/core/utils/auth_utils.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';

class AuthTestWidget extends StatefulWidget {
  const AuthTestWidget({Key? key}) : super(key: key);

  @override
  State<AuthTestWidget> createState() => _AuthTestWidgetState();
}

class _AuthTestWidgetState extends State<AuthTestWidget> {
  Map<String, dynamic> _authData = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadAuthData();
  }

  Future<void> _loadAuthData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final authData = await AuthUtils.getAuthData();
      setState(() {
        _authData = authData;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testAuthentication() async {
    try {
      final isAuthenticated = await AuthUtils.isAuthenticated();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            context,
            "Auth Test",
            isAuthenticated
                ? "User is authenticated"
                : "User is not authenticated",
            isAuthenticated ? SnackBarType.success : SnackBarType.warning,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            context,
            "Error",
            "Error testing authentication: $e",
            SnackBarType.error,
          ),
        );
      }
    }
  }

  Future<void> _clearAuthData() async {
    try {
      await AuthUtils.clearAuthData();
      await _loadAuthData();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            context,
            "Success",
            "Authentication data cleared",
            SnackBarType.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            context,
            "Error",
            "Error clearing auth data: $e",
            SnackBarType.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Authentication Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Token: ${_authData['token'] ?? 'null'}'),
                  const SizedBox(height: 8),
                  Text('User ID: ${_authData['userId'] ?? 'null'}'),
                  const SizedBox(height: 8),
                  Text('Is Logged In: ${_authData['isLoggedIn'] ?? false}'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _testAuthentication,
                        child: const Text('Test Auth'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _clearAuthData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Clear Auth'),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

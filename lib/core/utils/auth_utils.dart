import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static Future<bool> saveAuthData({
    required String token,
    required String userId,
    String? email,
    String? name,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
      await prefs.setString('user_id', userId);
      await prefs.setBool('is_logged_in', true);

      // Save email and name if provided
      if (email != null) {
        await prefs.setString('user_email', email);
      }
      if (name != null) {
        await prefs.setString('user_name', name);
      }

      return true;
    } catch (e) {
      debugPrint("Error saving auth data: $e");
      return false;
    }
  }

  static Future<bool> isAuthenticated() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('is_logged_in') ?? false;
    } catch (e) {
      debugPrint("Error checking auth status: $e");
      return false;
    }
  }

  static Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('auth_token');
    } catch (e) {
      debugPrint("Error getting token: $e");
      return null;
    }
  }

  static Future<String?> getUserId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_id');
    } catch (e) {
      debugPrint("Error getting user ID: $e");
      return null;
    }
  }

  static Future<String?> getUserEmail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_email');
    } catch (e) {
      debugPrint("Error getting user email: $e");
      return null;
    }
  }

  static Future<String?> getUserName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_name');
    } catch (e) {
      debugPrint("Error getting user name: $e");
      return null;
    }
  }

  static Future<void> clearAuthData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
      await prefs.remove('user_id');
      await prefs.remove('is_logged_in');
      await prefs.remove('user_email');
      await prefs.remove('user_name');
    } catch (e) {
      debugPrint("Error clearing auth data: $e");
    }
  }
}

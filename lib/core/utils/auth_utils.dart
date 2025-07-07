import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static const String _tokenKey = 'token';
  static const String _userIdKey = 'id';
  static const String _isLoggedInKey = 'isLoggedIn';

  // Check if user is authenticated with valid token
  static Future<bool> isAuthenticated() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_tokenKey);
      final isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;

      if (token != null && token.isNotEmpty && isLoggedIn) {
        // Check if token is not expired
        try {
          if (!JwtDecoder.isExpired(token)) {
            debugPrint("AuthUtils: User is authenticated with valid token");
            return true;
          } else {
            debugPrint("AuthUtils: Token is expired");
            await _clearAuthData(prefs);
            return false;
          }
        } catch (e) {
          debugPrint("AuthUtils: Error validating token: $e");
          await _clearAuthData(prefs);
          return false;
        }
      } else {
        debugPrint("AuthUtils: No valid authentication data found");
        return false;
      }
    } catch (e) {
      debugPrint("AuthUtils: Error checking authentication: $e");
      return false;
    }
  }

  // Get current token
  static Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_tokenKey);

      if (token != null && token.isNotEmpty) {
        // Validate token is not expired
        try {
          if (!JwtDecoder.isExpired(token)) {
            return token;
          } else {
            debugPrint("AuthUtils: Token is expired, clearing data");
            await _clearAuthData(prefs);
            return null;
          }
        } catch (e) {
          debugPrint("AuthUtils: Error validating token: $e");
          await _clearAuthData(prefs);
          return null;
        }
      }
      return null;
    } catch (e) {
      debugPrint("AuthUtils: Error getting token: $e");
      return null;
    }
  }

  // Get user ID
  static Future<String?> getUserId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_userIdKey);
    } catch (e) {
      debugPrint("AuthUtils: Error getting user ID: $e");
      return null;
    }
  }

  // Save authentication data
  static Future<bool> saveAuthData({
    required String token,
    required String userId,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);
      await prefs.setString(_userIdKey, userId);
      await prefs.setBool(_isLoggedInKey, true);
      debugPrint("AuthUtils: Authentication data saved successfully");
      return true;
    } catch (e) {
      debugPrint("AuthUtils: Error saving authentication data: $e");
      return false;
    }
  }

  // Clear authentication data
  static Future<bool> clearAuthData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await _clearAuthData(prefs);
      debugPrint("AuthUtils: Authentication data cleared successfully");
      return true;
    } catch (e) {
      debugPrint("AuthUtils: Error clearing authentication data: $e");
      return false;
    }
  }

  // Private method to clear auth data
  static Future<void> _clearAuthData(SharedPreferences prefs) async {
    await prefs.remove(_tokenKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_isLoggedInKey);
  }

  // Validate token format and expiration
  static bool isValidToken(String token) {
    try {
      if (token.isEmpty) return false;

      final decoded = JwtDecoder.decode(token);
      if (!decoded.containsKey('id')) return false;

      return !JwtDecoder.isExpired(token);
    } catch (e) {
      debugPrint("AuthUtils: Error validating token format: $e");
      return false;
    }
  }

  // For testing purposes - get all auth data
  static Future<Map<String, dynamic>> getAuthData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return {
        'token': prefs.getString(_tokenKey),
        'userId': prefs.getString(_userIdKey),
        'isLoggedIn': prefs.getBool(_isLoggedInKey) ?? false,
      };
    } catch (e) {
      debugPrint("AuthUtils: Error getting auth data: $e");
      return {};
    }
  }
}

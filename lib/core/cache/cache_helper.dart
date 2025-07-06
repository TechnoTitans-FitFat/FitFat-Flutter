import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("CacheHelper initialized");
  }

  // Ensure SharedPreferences is initialized
  static Future<SharedPreferences> _getPrefs() async {
    if (_sharedPreferences == null) {
      await init();
    }
    return _sharedPreferences!;
  }

  // Get string data
  static Future<String?> getDataString({required String key}) async {
    final prefs = await _getPrefs();
    final value = prefs.getString(key);
    debugPrint("CacheHelper getDataString: key=$key, value=$value");
    return value;
  }

  // Get token specifically
  static Future<String?> getToken() async {
    final prefs = await _getPrefs();
    final token = prefs.getString("token");
    debugPrint("CacheHelper getToken: token=$token");
    return token;
  }

  // Save data with type checking
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    final prefs = await _getPrefs();
    debugPrint("CacheHelper saveData: key=$key, value=$value");
    if (value is bool) {
      return await prefs.setBool(key, value);
    } else if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is double) {
      return await prefs.setDouble(key, value);
    } else {
      throw Exception("Unsupported data type for SharedPreferences");
    }
  }

  // Get generic data
  static Future<dynamic> getData({required String key}) async {
    final prefs = await _getPrefs();
    final value = prefs.get(key);
    debugPrint("CacheHelper getData: key=$key, value=$value");
    return value;
  }

  // Remove specific key
  static Future<bool> removeData({required String key}) async {
    final prefs = await _getPrefs();
    debugPrint("CacheHelper removeData: key=$key");
    return await prefs.remove(key);
  }

  // Check if key exists
  static Future<bool> containsKey({required String key}) async {
    final prefs = await _getPrefs();
    final exists = prefs.containsKey(key);
    debugPrint("CacheHelper containsKey: key=$key, exists=$exists");
    return exists;
  }

  // Clear all data
  static Future<bool> clearData() async {
    final prefs = await _getPrefs();
    debugPrint("CacheHelper clearData");
    return await prefs.clear();
  }
}

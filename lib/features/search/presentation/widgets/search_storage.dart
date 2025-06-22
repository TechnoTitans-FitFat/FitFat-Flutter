/*import 'package:fitfat/features/search/data/models/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class SearchStorage {
  static const _historyKey = 'search_history';

  // Save history to shared preferences
  static Future<void> saveSearchHistory(SearchHistory history) async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = jsonEncode(history.name);
    await prefs.setString(_historyKey, historyJson);
  }

  // Load history from shared preferences
  static Future<SearchHistory> loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getString(_historyKey);

    if (historyJson != null) {
      final List<dynamic> nameList = jsonDecode(historyJson);
      return SearchHistory(name: List<String>.from(nameList), title: []);
    } else {
      return SearchHistory.empty();
    }
  }
}
*/

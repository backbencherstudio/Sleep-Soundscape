import 'package:shared_preferences/shared_preferences.dart';

class AuthStorageService {
  static const String _tokenKey = "token"; // Define key to avoid duplication

  /// Store token
  static Future<void> saveToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  /// Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Delete token
  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}

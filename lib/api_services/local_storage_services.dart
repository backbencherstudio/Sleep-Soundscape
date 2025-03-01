import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Assuming .sp, .h, .w come from this
import 'package:shared_preferences/shared_preferences.dart';

// AuthStorageService (unchanged from your provided code)
class AuthStorageService {
  static const String _tokenKey = "token";
  static const String _name = "name";
  static const String _email = "email";
  static const String _image = "image";

  /// Store token
  static Future<void> saveToken({
    required String token,
    required String name,
    required String email,
    String? image,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_name, name);
    await prefs.setString(_email, email);
    await prefs.setString(_image, image ?? "");

  }

  /// Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_name);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_email);
  }

  static Future<String?> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_image);
  }

  /// Delete token
  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;
  bool _isLoading = false;
  String? _errorMessage;
  bool _obscureText = true;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isObscure => _obscureText;

  /// Toggle password visibility
  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  /// Create a new user account
  Future<bool> createUser({required String email, required String password, required String name}) async {
    _setLoading(true);
    _isSuccess =false;

    final url = Uri.parse(AppUrls.signUp);
    final body = jsonEncode({
      "email": email,
      "password": password,
      "name": name,
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        _isSuccess =true;
        _setLoading(false);
        debugPrint(" Response data: ${response.body}");
        return true;
      } else {
      }
    } catch (e) {
    }
    _isSuccess =false;
    _setLoading(false);
    return false;
  }

  /// Update loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }



}

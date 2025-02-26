import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';

class ForgetPassProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> sendResetCode(String email) async {
    if (email.isEmpty) {
      _errorMessage = "Email cannot be empty";
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse('${AppUrls.baseUrl}/auth/forgot-password');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      if (response.statusCode == 200) {
        _isLoading = false;
        notifyListeners();
        return true; // Success
      } else {
        _errorMessage = "Failed to send reset code";
      }
    } catch (e) {
      _errorMessage = "Something went wrong: $e";
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';

class ForgetPassProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Send Reset Code Function
  Future<void> sendResetCode(String email) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final body = {"email": email};

    try {
      final response = await http.post(
        Uri.parse(AppUrls.forgotPassword),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      debugPrint(" Reset Password Response: ${response.body}");

      if (response.statusCode == 200) {
          debugPrint(" Reset Code Sent Successfully!");
          
      } else {
        debugPrint(" Failed to send reset code: ");

        // _errorMessage = "Error: ${response.statusCode}";
      }
    } catch (error) {
      debugPrint(" Failed to send reset code: ");

      _errorMessage = "Network error: $error";
      print(" Error Sending Reset Code: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

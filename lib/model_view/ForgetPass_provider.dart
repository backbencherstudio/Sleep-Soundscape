import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';

class ForgetPassProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool _isSuccess = false;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  
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

      debugPrint("Reset Password Response: ${response.body}");

      if (response.statusCode == 200) {
        debugPrint("Reset Code Sent Successfully!");
      } else {
        debugPrint("Failed to send reset code.");
      }
    } catch (error) {
      debugPrint("Failed to send reset code.");
      _errorMessage = "Network error: $error";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  
  Future<void> verifyOtp(String email, String otp) async {
  _isSuccess = false;
  _errorMessage = null;
  notifyListeners();

  
  if (otp.isEmpty || otp.length < 4) {
    _errorMessage = "Invalid OTP";
    notifyListeners();
    return;
  }

  final body = {
    "email": email.trim(),
    "otp": otp.trim(),
  };

  debugPrint("Sending OTP verification request with body: ${jsonEncode(body)}");

  _isLoading = true;
  notifyListeners();

  try {
    final response = await http.post(
      Uri.parse('${AppUrls.baseUrl}/api/users/verify-reset-code'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body), 
    );

    debugPrint("Response Status: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      debugPrint("OTP Verified Successfully!");
      _isSuccess = true;
    } else {
     
      final responseBody = jsonDecode(response.body);
      _errorMessage = "Failed to verify OTP: ${responseBody['message'] ?? 'Unknown error'}";
    }
  } catch (error) {
    _errorMessage = "Error verifying OTP: $error";
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}


 Future<void> resetPassword(String email, 
//  String otp, 
 String newPassword, 
 String confirmPassword
 
 ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    if (newPassword != confirmPassword) {
      _errorMessage = "Passwords do not match!";
      _isLoading = false;
      notifyListeners();
      return;
    }

    final body = {
      "email": email.trim(),
      "newPassword":newPassword.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse('${AppUrls.baseUrl}/api/users/reset-password'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      debugPrint("Response Status: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        debugPrint("Password Reset Successfully!");
        _isSuccess = true;
      } else {
        final responseBody = jsonDecode(response.body);
        _errorMessage = "Failed to reset password: ${responseBody['message'] ?? 'Unknown error'}";
      }
    } catch (error) {
      _errorMessage = "Error resetting password: $error";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


}

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';
import 'dart:convert';
import '../api_services/local_storage_services.dart';

class ChangePasswordProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> changePassword(String currentPassword, String newPassword) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify UI to update loading state

    debugPrint(" Attempting to change password...");
    debugPrint("➡ Current Password: $currentPassword");
    debugPrint("➡ New Password: $newPassword");

    try {
      // Fetch User Token
      String? token = await AuthStorageService.getToken();
      debugPrint(" User Token --------: $token");

      if (token == null || token.isEmpty) {
        _errorMessage = "User token is missing";
        debugPrint(" $_errorMessage");
        _isLoading = false;
        notifyListeners();
        return;
      }

      // API Request Body
      final body = jsonEncode({
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      });

      // Headers
      final headers = {
        "Authorization": token,
        "Content-Type": "application/json",
      };
      final response = await http.patch(
        Uri.parse(AppUrls.changePassword),
        headers: headers,
        body: body,
      );


      debugPrint(" API Response Code: ${response.statusCode}");
      debugPrint(" API Response Body: ${response.body}");

      // Handle API Response
      if (response.statusCode == 200) {
        debugPrint("Password changed successfully!");
      } else {
        _errorMessage = "Failed to change password: ${response.body}";
        debugPrint(" $_errorMessage");
      }
    } catch (error) {
      _errorMessage = "Password change failed: $error";
      debugPrint(" $_errorMessage");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI to update state
    }
  }
}

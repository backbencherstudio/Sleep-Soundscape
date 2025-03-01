import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';
import 'package:sleep_soundscape/api_services/api_services.dart';
import 'package:sleep_soundscape/model/login_data_model.dart';

class LoginAuthProvider with ChangeNotifier {

  bool _isLoginProgress = false;
  bool _isSuccess = false;

  bool get isLoginProgress => _isLoginProgress;
  bool get isSuccess => _isSuccess;

  // Store login data
  LoginDataModel? _loginData;
  LoginDataModel? get loginData => _loginData;

  // Store user data
  User? _userData;
  User? get userData => _userData;

  /// Method to perform user login
  Future<void> userLogin(String? email, String? password) async {
    _isLoginProgress = true;
    notifyListeners(); // Notify UI that login is in progress

    // Request body for login API
    Map<String, dynamic> requestBody = {"email": email, "password": password};

    try {
      // Call API service
      http.Response response = await ApiServices.postApi(
        url: AppUrls.loginUrl,
        body: requestBody,
        headers: {"Content-Type": "application/json"},
      );

      var jsonResponse = jsonDecode(response.body);
      debugPrint("\n\nLogin response : ${jsonResponse}\n\n");

      if (response.statusCode == 200 && jsonResponse['success'] == true) {
        debugPrint("\njson response success : ${jsonResponse['success']}");

        _isSuccess = true;

        _loginData = LoginDataModel.fromJson(jsonResponse);

        _userData = _loginData?.user;

        debugPrint("\nUser name: ${_loginData?.user?.name}");
      } else {
        _isSuccess = false;
      }
    } catch (e) {
      _isSuccess = false;
      debugPrint("Error : $e");
    } finally {
      // Ensure loading state is updated after API call
      _isLoginProgress = false;
      notifyListeners();
    }
  }
}

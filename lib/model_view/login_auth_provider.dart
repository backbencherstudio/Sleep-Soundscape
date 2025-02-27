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

  LoginDataModel? _loginData;

  LoginDataModel? get loginData => _loginData;


  /// Method to perform user login
  Future<void> userLogin(String email, String password) async {
    _isLoginProgress = true;

    notifyListeners();

    // Request body for login API
    Map<String, dynamic> requestBody = {"email": email, "password": password};

    try {

      // Call API service
      http.Response response = await ApiServices.postApi(
        url: AppUrls.loginUrl,
        body: requestBody,
        headers: {"Content-Type": "application/json"},
      );

      // Decode response body
      var jsonResponse = jsonDecode(response.body);

      debugPrint("\n\nLogin response : ${jsonResponse}\n\n");


      // If API call is successful
      if (response.statusCode == 200) {
        _isSuccess = true;
        _loginData = LoginDataModel.fromJson(jsonResponse ?? {});
      } else {
        _isSuccess = false;
      }
    } catch (e) {
      _isSuccess = false;
      _isLoginProgress = false;
      notifyListeners();
      debugPrint("Error : $e");
    }

    _isLoginProgress = false;
    notifyListeners();
  }

}

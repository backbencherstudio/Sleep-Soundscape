import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = false;
  String? _errorMessage;
  bool _obscureText = true;
  File? _selectedImage;

  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isObscure => _obscureText;
  File? get selectedImage => _selectedImage;

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void setImage(File image) {
    _selectedImage = image;
    notifyListeners();
  }

  Future<bool> createUser({
    required String name,
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    _isSuccess = false;
    _errorMessage = null;

    final url = Uri.parse(AppUrls.signUp);

    try {
      var request = http.MultipartRequest("POST", url);
      request.fields["name"] = name;
      request.fields["email"] = email;
      request.fields["password"] = password;

      if (_selectedImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          "image", // Ensure this matches the backend's expected field name
          _selectedImage!.path,
        ));
      }

      var response = await request.send();
      final responseData = await http.Response.fromStream(response);

      debugPrint("Response Data: ${responseData.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        _isSuccess = true;
        _errorMessage = null;
        _setLoading(false);
        return true;
      } else {
        _errorMessage = "Signup failed: ${responseData.body}";
      }
    } catch (e) {
      _errorMessage = "Error: ${e.toString()}";
    }

    _setLoading(false);
    return false;
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}

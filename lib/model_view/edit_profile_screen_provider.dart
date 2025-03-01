import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../api_services/local_storage_services.dart';
import '../api_services/api_end_point.dart';

class EditProfileProvider extends ChangeNotifier {
  File? _selectedImage;
  String? _name;
  bool _isSuccess =false;
  File? get selectedImage => _selectedImage;
  String? get name => _name;

  void setImage(File image) {
    _selectedImage = image;
    notifyListeners();
  }

  // Set the name
  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  // Edit profile API call with image upload
  Future<bool> editProfile({
    required String name,
    required File image,
  }) async {
    _isLoading;  // Show loading state

    try {
      final token = await AuthStorageService.getToken();
      if (token == null || token.isEmpty) {
        throw Exception("Token is missing");
      }

      final headers = {
        "Authorization": token,
      };

      final request = http.MultipartRequest("PUT", Uri.parse(AppUrls.editProfile));
      request.headers.addAll(headers);

      // Add name to the form data
      request.fields["name"] = name;

      if (image != null) {
        var imageFile = await http.MultipartFile.fromPath(
          'image',
          image.path,
        );
        request.files.add(imageFile);
      }

      // Send the request and get the response
      var response = await request.send();
      final responseData = await http.Response.fromStream(response);

      debugPrint("Response Data: ${responseData.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        _isSuccess = true;
        _errorMessage = null;
        _isLoading;
        return true;
      } else {
        _errorMessage = "Profile update failed: ${responseData.body}";
        _isLoading;
        return false;
      }
    } catch (e) {
      _errorMessage = "Error: ${e.toString()}";
      _isLoading;
      return false;
    }
  }

  // Show loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // Helper method to set loading state (optional)
  // void _isLoading(bool loading) {
  //   _isLoading = loading;
  //   notifyListeners();
  // }
}

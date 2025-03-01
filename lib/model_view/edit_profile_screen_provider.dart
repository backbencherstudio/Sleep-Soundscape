import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../api_services/local_storage_services.dart';
import '../api_services/api_end_point.dart';

class EditProfileProvider extends ChangeNotifier {
  File? _selectedImage;
  String? _name;
  bool _isSuccess = false;

  File? get selectedImage => _selectedImage;
  String? get name => _name;

  void setImage(File image) {
    _selectedImage = image;
    notifyListeners();
  }

  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  Future<bool> editProfile({
    required String? name,
    required File? image,
  }) async {
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
      request.fields["name"] = name!;

      if (image != null) {
        var imageFile = await http.MultipartFile.fromPath(
          'image',
          image.path,
        );
        request.files.add(imageFile);
      }
      var response = await request.send();
      final responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        _isSuccess = true;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

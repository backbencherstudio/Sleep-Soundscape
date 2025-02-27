import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';

class ForgetpassauthService {
  final AppUrls appUrl = AppUrls();

  Future<bool> forgotPassword(String email) async {
    final url = Uri.parse('${AppUrls.baseUrl}/users/forgot-password');
 final body ={"email": email};
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      debugPrint("Response Status: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {

        debugPrint("\n\n ${response.statusCode}\n\n");
       

        final responseBody = jsonDecode(response.body);
        if (responseBody['message'] == "Reset code sent to your email") {
          return true; 
        } else {
          return false; 
        }
      } else {
        
        debugPrint("Error Response Body : ${response.body}");
        return false; 
      }
    } catch (e) {
      // Log and throw exception in case of failure
      debugPrint("catch blog: $e");
          debugPrint("\n\n fail to send code\n\n");
      throw Exception("Failed to send request: $e");
    }
  }
}

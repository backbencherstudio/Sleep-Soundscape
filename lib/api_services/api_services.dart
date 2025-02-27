import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  static Future<dynamic> postApi(
      {required String url,
        required Map<String, dynamic> body,
        Map<String, String>? headers}) async {
    try {
      http.Response response =
      await http.post(Uri.parse(url), body: jsonEncode(body), headers: headers);
      return response;
    } catch (error) {
      debugPrint("Error : $error}");
      return {"success": "Failed"};
    }
  }

  static Future<dynamic> getApi(
      {required String url, String? header}) async {
    try {
      final headers = {
        'Authorization': header ?? "",
      };
      debugPrint("\nURL : $url\n");

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      return response;
    } catch (error) {
      debugPrint("\n\nError : ${error}\n");
      return {"\nsuccess": "Failed"};
    }
  }

}
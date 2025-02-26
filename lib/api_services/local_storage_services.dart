import 'package:shared_preferences/shared_preferences.dart';

class AuthStorageService{

  ///store a string
  static Future<void> saveToken({required String key, required String value}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  /// get access to a string
  static Future<String?> getToken ({required String key}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString(key);
    return token;
  }

  /// delete token from the storage
  static Future<void> removeToken () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }


}
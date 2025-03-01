import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:sleep_soundscape/api_services/api_end_point.dart';
import 'package:http/http.dart' as http;
class UpdateprofileProvider with ChangeNotifier{


bool _isLoading = false;
bool get isLoading => _isLoading;

final url = AppUrls.updateProfile;

Future<void> updateProfile({
  required String token,
  required String name,
  required String email,
  File? image,
})async{
  _isLoading =true;
  notifyListeners();
try{
  var request = http.MultipartRequest('PUT', Uri.parse(url));

  //etay alada bhabe token and headers and file pass kora lage

  request.headers['Authentication'] = token;
if(name.isNotEmpty){
request.fields['name'] = name;
}

if(email.isNotEmpty){
request.fields['email'] = email;
}

if(image!= null){
 var file = await http.MultipartFile.fromPath(
  'image',
  image.path
 );
request.files.add(file);
}
 var response = await request.send();


 if(response.statusCode == 200){
  final responseData = await response.stream.bytesToString();
  final Map<String, dynamic> responseJson = json.decode(responseData);

  if(responseJson['success']){
    print("User uodate succesfully");

  }else{
    print("\n\n Error :$Error ");
  }
 }
}catch(Error){

  debugPrint("\n\n $Error \n\n");
}
}



}
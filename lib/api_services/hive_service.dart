import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import '../model/sound_setting_model.dart';

class HiveServices {
  static const String _boxName = "soundSettings";
  /// Save Sound Settings
  static Future<void> saveSoundSettings(SoundSettingModel settings) async {
    try {
      var box = Hive.box('alarmSettings');
      var encodedData = jsonEncode(settings.toJson());
      await box.put("settings", encodedData);
      print("Saved Data: ${box.get("settings")}");
    } catch (error) {
      debugPrint("Error while saving to Hive: $error");
    }
  }

  /// Retrieve Sound Settings
  static Future<SoundSettingModel?> getSoundSettings() async {
    try {
      var boxx = await Hive.openBox('alarmSettings');
      var box = Hive.box('alarmSettings');
      var data =await box.get("settings");

      var rawData = data.toString().trim();

      if(rawData.isNotEmpty){
        //  if (decodedData is Map<String, dynamic>) {
        var decodedData = jsonDecode(rawData);
        debugPrint("\nData fetched successful.\n");
        return SoundSettingModel.fromJson(Map<String, dynamic>.from(decodedData));
        //  }
        //  else{
        //   debugPrint("\nData fetched failed! decoded data : $decodedData\n");
        //   return SoundSettingModel();
        // }
      }


    } catch (error) {
      debugPrint("Error while retrieving from Hive: $error");
      return SoundSettingModel();
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import '../api_services/hive_service.dart';
import '../model/sound_setting_model.dart';

class SoundSettingProvider extends ChangeNotifier {
  SoundSettingModel _soundSettings = SoundSettingModel();

  SoundSettingModel get soundSettings => _soundSettings;

  SoundSettingProvider(){
    loadSettings();
  }

  /// Load settings from Hive
  Future<void> loadSettings() async {
    SoundSettingModel? settings = await HiveServices.getSoundSettings();
    if (settings != null) {
      _soundSettings = settings;
      notifyListeners();
    }
  }

  /// Toggle Alarm
  void toggleAlarm() {
    _soundSettings.alarm ??= Alarm();
   _soundSettings.alarm!.enabled = !(_soundSettings.alarm!.enabled ?? false);
   // _soundSettings.alarm!.enabled = !_soundSettings.alarm!.enabled!;
    saveSettings();
  }

  /// Toggle Vibration
  void toggleVibration() {
    _soundSettings.alarm ??= Alarm();
    _soundSettings.alarm!.vibration = !(_soundSettings.alarm!.vibration ?? false);
    saveSettings();
  }

  /// Set Volume
  void setVolume(int volume) {
    _soundSettings.alarm ??= Alarm();
    _soundSettings.alarm!.volume = volume;
    saveSettings();
  }
// sound detection
  void soundDetection() {
    _soundSettings.sleepAnalysis?.soundsDetection ??= SoundsDetection();
    _soundSettings.sleepAnalysis?.soundsDetection?.enabled = !(_soundSettings.sleepAnalysis?.soundsDetection?.enabled ?? false);
    saveSettings();
  }
  /// Toggle AutoPlay
  void toggleAutoPlay() {
    _soundSettings.soundscapes ??= Soundscapes();
    _soundSettings.soundscapes!.alarmAutoplay = !(_soundSettings.soundscapes!.alarmAutoplay ?? false);
    saveSettings();
  }

  /// Set Snooze Time
  void setSnooze(int value) {
    _soundSettings.advanced ??= Advanced();
    _soundSettings.advanced!.snooze = value;
    saveSettings();
  }

  /// Set Alarm Mode
  void setAlarmMode(String mode) {
    _soundSettings.advanced ??= Advanced();
    _soundSettings.advanced!.alarmMode = mode;
    saveSettings();
  }

  /// Set Get-Up Challenge
  void setGetUpChallenge(String challenge) {
    _soundSettings.advanced ??= Advanced();
    _soundSettings.advanced!.getUpChallenge = challenge;
    saveSettings();
  }

  /// Save to Hive and Notify Listeners
  Future<void> saveSettings() async {
  await  HiveServices.saveSoundSettings(_soundSettings);
    notifyListeners();
  }
}

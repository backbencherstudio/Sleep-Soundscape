import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class AlarmSettings extends ChangeNotifier {
  @HiveField(0)
  bool alarm;

  @HiveField(1)
  bool vibration;

  @HiveField(2)
  int volume;

  @HiveField(3)
  String ringtoneName;

  @HiveField(4)
  String ringtoneFile;

  @HiveField(5)
  int snoozeTime;

  @HiveField(6)
  String alarmMode;

  @HiveField(7)
  String getUpChallenge;

  AlarmSettings({
    this.alarm = false,
    this.vibration = false,
    this.volume = 50,
    this.ringtoneName = "Default",
    this.ringtoneFile = "",
    this.snoozeTime = 5,
    this.alarmMode = "Normal",
    this.getUpChallenge = "None",
  });

  void toggleAlarm() {
    alarm = !alarm;
    notifyListeners();
    _save();
  }

  void toggleVibration() {
    vibration = !vibration;
    notifyListeners();
    _save();
  }

  void setVolume(int value) {
    volume = value.clamp(0, 100);
    notifyListeners();
    _save();
  }

  void setRingtone(String name, String file) {
    ringtoneName = name;
    ringtoneFile = file;
    notifyListeners();
    _save();
  }

  void setSnooze(int value) {
    snoozeTime = value;
    notifyListeners();
    _save();
  }

  void setAlarmMode(String mode) {
    alarmMode = mode;
    notifyListeners();
    _save();
  }

  void setGetUpChallenge(String challenge) {
    getUpChallenge = challenge;
    notifyListeners();
    _save();
  }

  Future<void> _save() async {
    try {
      var box = await Hive.openBox<AlarmSettings>('alarmSettings');
      await box.put('settings', this);
    } catch (error) {
      debugPrint("Error while saving alarm settings: $error");
    }
  }

  static Future<AlarmSettings> load() async {
    var box = await Hive.openBox<AlarmSettings>('alarmSettings');
    return box.get('settings', defaultValue: AlarmSettings())!;
  }
}

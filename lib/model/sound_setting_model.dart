class SoundSettingModel {
  Alarm? alarm;
  SleepAnalysis? sleepAnalysis;
  Soundscapes? soundscapes;
  Advanced? advanced;

  SoundSettingModel(
      {this.alarm, this.sleepAnalysis, this.soundscapes, this.advanced});

  SoundSettingModel.fromJson(Map<String, dynamic> json) {
    alarm = json['alarm'] != null ? new Alarm.fromJson(json['alarm']) : null;
    sleepAnalysis = json['sleep_analysis'] != null
        ? new SleepAnalysis.fromJson(json['sleep_analysis'])
        : null;
    soundscapes = json['soundscapes'] != null
        ? new Soundscapes.fromJson(json['soundscapes'])
        : null;
    advanced = json['advanced'] != null
        ? new Advanced.fromJson(json['advanced'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.alarm != null) {
      data['alarm'] = this.alarm!.toJson();
    }
    if (this.sleepAnalysis != null) {
      data['sleep_analysis'] = this.sleepAnalysis!.toJson();
    }
    if (this.soundscapes != null) {
      data['soundscapes'] = this.soundscapes!.toJson();
    }
    if (this.advanced != null) {
      data['advanced'] = this.advanced!.toJson();
    }
    return data;
  }
}

class Alarm {
  bool? enabled;
  bool? vibration;
  int? volume;
  Ringtone? ringtone;

  Alarm({this.enabled = false, this.vibration = false, this.volume = 1, this.ringtone});

  Alarm.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
    vibration = json['vibration'];
    volume = json['volume'];
    ringtone = json['ringtone'] != null
        ? new Ringtone.fromJson(json['ringtone'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enabled'] = this.enabled;
    data['vibration'] = this.vibration;
    data['volume'] = this.volume;
    if (this.ringtone != null) {
      data['ringtone'] = this.ringtone!.toJson();
    }
    return data;
  }
}

class Ringtone {
  String? name;
  String? file;

  Ringtone({this.name = "ringtone", this.file = "music/waves-02.mp3"});

  Ringtone.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['file'] = this.file;
    return data;
  }
}

class SleepAnalysis {
  SoundsDetection? soundsDetection;

  SleepAnalysis({this.soundsDetection});

  SleepAnalysis.fromJson(Map<String, dynamic> json) {
    soundsDetection = json['sounds_detection'] != null
        ? new SoundsDetection.fromJson(json['sounds_detection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.soundsDetection != null) {
      data['sounds_detection'] = this.soundsDetection!.toJson();
    }
    return data;
  }
}

class SoundsDetection {
  bool? enabled;
  String? description;

  SoundsDetection({this.enabled, this.description});

  SoundsDetection.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enabled'] = this.enabled;
    data['description'] = this.description;
    return data;
  }
}

class Soundscapes {
  String? current;
  bool? alarmAutoplay;
  int? audioTimer;

  Soundscapes({this.current, this.alarmAutoplay, this.audioTimer});

  Soundscapes.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    alarmAutoplay = json['alarm_autoplay'];
    audioTimer = json['audio_timer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['alarm_autoplay'] = this.alarmAutoplay;
    data['audio_timer'] = this.audioTimer;
    return data;
  }
}

class Advanced {
  int? snooze;
  String? alarmMode;
  String? getUpChallenge;

  Advanced({this.snooze, this.alarmMode, this.getUpChallenge});

  Advanced.fromJson(Map<String, dynamic> json) {
    snooze = json['snooze'];
    alarmMode = json['alarm_mode'];
    getUpChallenge = json['get_up_challenge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['snooze'] = this.snooze;
    data['alarm_mode'] = this.alarmMode;
    data['get_up_challenge'] = this.getUpChallenge;
    return data;
  }
}
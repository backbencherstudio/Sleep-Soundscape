class ReminderModel {
  List<ReminderList>? reminderList;

  ReminderModel({this.reminderList});

  ReminderModel.fromJson(Map<String, dynamic> json) {
    if (json['reminderList'] != null) {
      reminderList = <ReminderList>[];
      json['reminderList'].forEach((v) {
        reminderList!.add(new ReminderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reminderList != null) {
      data['reminderList'] = this.reminderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReminderList {
  String? title;
  String? time;
  String? amPm;
  String? days;

  ReminderList({this.title, this.time, this.amPm, this.days});

  ReminderList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
    amPm = json['amPm'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['time'] = this.time;
    data['amPm'] = this.amPm;
    data['days'] = this.days;
    return data;
  }
}

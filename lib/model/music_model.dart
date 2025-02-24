class MusicModel {
  List<MusicList>? musicList;

  MusicModel({this.musicList});

  MusicModel.fromJson(Map<String, dynamic> json) {
    if (json['musicList'] != null) {
      musicList = <MusicList>[];
      json['musicList'].forEach((v) {
        musicList!.add(new MusicList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.musicList != null) {
      data['musicList'] = this.musicList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicList {
  String? title;
  String? subtitle;
  String? imagePath;
  String? audioPath;

  MusicList({this.title, this.subtitle, this.imagePath, this.audioPath});

  MusicList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    imagePath = json['imagePath'];
    audioPath = json['audioPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['imagePath'] = this.imagePath;
    data['audioPath'] = this.audioPath;
    return data;
  }
}

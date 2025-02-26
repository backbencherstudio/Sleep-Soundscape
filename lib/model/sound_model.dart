class GetSound {
  String? sId;
  String? category;
  String? title;
  String? subtitle;
  String? imagePath;
  String? audioPath;
  int? iV;

  GetSound(
      {this.sId,
        this.category,
        this.title,
        this.subtitle,
        this.imagePath,
        this.audioPath,
        this.iV});

  GetSound.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    title = json['title'];
    subtitle = json['subtitle'];
    imagePath = json['imagePath'];
    audioPath = json['audioPath'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['imagePath'] = this.imagePath;
    data['audioPath'] = this.audioPath;
    data['__v'] = this.iV;
    return data;
  }
}

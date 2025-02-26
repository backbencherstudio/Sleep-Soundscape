class SoundModel {
  String? sId;
  String? category;
  String? title;
  String? subtitle;
  String? imagePath;
  String? audioPath;
  int? iV;

  SoundModel({
    this.sId,
    this.category,
    this.title,
    this.subtitle,
    this.imagePath,
    this.audioPath,
    this.iV,
  });

  factory SoundModel.fromJson(Map<String, dynamic> json) {
    return SoundModel(
      sId: json['_id'],
      category: json['category'],
      title: json['title'],
      subtitle: json['subtitle'],
      imagePath: json['imagePath'],
      audioPath: json['audioPath'],
      iV: json['__v'],
    );
  }

  static List<SoundModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => SoundModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'category': category,
      'title': title,
      'subtitle': subtitle,
      'imagePath': imagePath,
      'audioPath': audioPath,
      '__v': iV,
    };
  }
}

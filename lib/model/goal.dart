class Goal {
  final String title;
  final String description;
  final String img;

  Goal({required this.title, required this.description, required this.img});

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      title: json["title"],
      description: json["description"],
      img: json["img"],
    );
  }
}
